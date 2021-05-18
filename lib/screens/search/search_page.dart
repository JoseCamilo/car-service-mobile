import 'package:car_service_mobile/screens/company/company_page.dart';
import 'package:car_service_mobile/screens/search/search_controller.dart';
import 'package:car_service_mobile/shared/widgets/banner_list_widget.dart';
import 'package:flutter/material.dart';

enum SearchState { success, loading, error, empty }

class SearchPageBuilderNavigator extends StatelessWidget {
  const SearchPageBuilderNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'search',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'search':
            return MaterialPageRoute(
                builder: (context) => SearchPage(), settings: settings);
            break;

          case 'company':
            return MaterialPageRoute(
                builder: (context) => CompanyPage(), settings: settings);
            break;

          default:
            throw Exception("Invalid route");
        }
      },
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controllerInputSearch = TextEditingController();
  final _controller = SearchController();
  List<ItemBannerListWidget> _storeList = [];

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.getCompaniesSubscription();
    _controller.stateNotifier.addListener(() {
      setState(() {
        this._storeList = _controller.storeList;
      });
    });

    _controllerInputSearch.addListener(() {
      setState(() {
        if (_controllerInputSearch.text.isEmpty) {
          this._storeList = _controller.storeList;
        } else {
          this._storeList = [];
          var inputText = _controllerInputSearch.text.toLowerCase();

          for (var i = 0; i < _controller.storeList.length; i++) {
            var isFind = true;
            var el = _controller.storeList[i];

            if (el.company.indexing.toLowerCase().contains(inputText)) {
              this._storeList.add(el);
              isFind = false;
            }

            if (isFind) {
              if (el.company.title.toLowerCase().contains(inputText) ||
                  el.company.address.toLowerCase().contains(inputText) ||
                  el.company.description.toLowerCase().contains(inputText)) {
                this._storeList.add(el);
                isFind = false;
              }
            }

            if (isFind) {
              for (var j = 0; j < el.company.services.length; j++) {
                var ser = el.company.services[j];
                if (ser.title.toLowerCase().contains(inputText) ||
                    ser.description.toLowerCase().contains(inputText)) {
                  this._storeList.add(el);
                  isFind = false;
                }
              }
            }

            if (isFind) {
              for (var k = 0; k < el.company.servicesRecommended.length; k++) {
                var rec = el.company.servicesRecommended[k];
                if (rec.title.toLowerCase().contains(inputText) ||
                    rec.description.toLowerCase().contains(inputText)) {
                  this._storeList.add(el);
                  isFind = false;
                }
              }
            }
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _loadingListSliver = SliverToBoxAdapter();
    Widget _storeListSliver = SliverToBoxAdapter();
    Widget _titleStoreListSliver = SliverToBoxAdapter();
    Widget _emptyListSliver = SliverToBoxAdapter();

    switch (_controller.state) {
      case SearchState.success:
        _storeListSliver = SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return this._storeList[index];
            },
            childCount: this._storeList.length,
          ),
        );

        _titleStoreListSliver = SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Text(
              'Lojas disponíveis',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
        );
        break;
      case SearchState.empty:
        _emptyListSliver = SliverToBoxAdapter(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Center(
              child: Text(
                'Nenhuma Loja disponível!',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        );
        break;
      case SearchState.loading:
        _loadingListSliver = SliverToBoxAdapter(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Center(child: CircularProgressIndicator()),
          ),
        );
        break;
      default:
    }

    if (this._storeList.length == 0) {
      _emptyListSliver = SliverToBoxAdapter(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Center(
            child: Text(
              'Nada foi encontrado!',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
              child: TextField(
                controller: _controllerInputSearch,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  labelText: 'Pesquisar',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          _loadingListSliver,
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
          SliverAnimatedOpacity(
            opacity: _controller.state == SearchState.success ? 1 : 0,
            duration: Duration(seconds: 1),
            sliver: _titleStoreListSliver,
          ),
          SliverAnimatedOpacity(
            opacity: _controller.state == SearchState.success ? 1 : 0,
            duration: Duration(seconds: 1),
            sliver: _storeListSliver,
          ),
          _emptyListSliver,
        ],
      ),
    );
  }
}
