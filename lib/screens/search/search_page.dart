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
  final controller = SearchController();
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
    controller.getCompanies();
    controller.stateNotifier.addListener(() {
      setState(() {
        _storeList = controller.storeList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _loadingListSliver = SliverToBoxAdapter();
    Widget _storeListSliver = SliverToBoxAdapter();
    Widget _titleStoreListSliver = SliverToBoxAdapter();
    Widget _emptyListSliver = SliverToBoxAdapter();

    switch (controller.state) {
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

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
              child: TextField(
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
            opacity: controller.state == SearchState.success ? 1 : 0,
            duration: Duration(seconds: 1),
            sliver: _titleStoreListSliver,
          ),
          SliverAnimatedOpacity(
            opacity: controller.state == SearchState.success ? 1 : 0,
            duration: Duration(seconds: 1),
            sliver: _storeListSliver,
          ),
          _emptyListSliver,
        ],
      ),
    );
  }
}
