import 'package:car_service_mobile/screens/filter_dashboard/filter_dashboard_controller.dart';
import 'package:car_service_mobile/shared/widgets/banner_carousel_widget.dart';
import 'package:car_service_mobile/shared/widgets/banner_list_widget.dart';
import 'package:car_service_mobile/shared/widgets/refresh_widget.dart';
import 'package:flutter/material.dart';

enum FilterDashboardState { success, loading, error, empty }

class FilterDashboardPage extends StatefulWidget {
  final String title;
  final String subscription;

  const FilterDashboardPage({
    Key key,
    this.title,
    @required this.subscription,
  }) : super(key: key);

  @override
  _FilterDashboardPageState createState() => _FilterDashboardPageState();
}

class _FilterDashboardPageState extends State<FilterDashboardPage> {
  final controller = FilterDashboardController();
  List<ItemBannerListWidget> _storeList = [];
  List<ItemBannerCarouselWidget> _recomendedList = [];

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    loadPage();
  }

  Future loadPage() async {
    controller.getCompaniesSubscription(this.widget.subscription);
    controller.stateNotifier.addListener(() {
      setState(() {
        _storeList = controller.storeList;
        _recomendedList = controller.recomendedList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _loadingListSliver = SliverToBoxAdapter();
    Widget _storeListSliver = SliverToBoxAdapter();
    Widget _recommendedListSliver = SliverToBoxAdapter();
    Widget _titleStoreListSliver = SliverToBoxAdapter();
    Widget _emptyListSliver = SliverToBoxAdapter();

    switch (controller.state) {
      case FilterDashboardState.success:
        if (this._recomendedList.length > 0) {
          _recommendedListSliver = SliverToBoxAdapter(
            child: BannerCarouselWidget(
              title: 'Destaques',
              listBanner: this._recomendedList,
            ),
          );
        }

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
      case FilterDashboardState.empty:
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
      case FilterDashboardState.loading:
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
      appBar: AppBar(
        title: Text(
          this.widget.title,
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: GestureDetector(
          child:
              Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: RefreshWidget(
        onRefresh: loadPage,
        child: CustomScrollView(
          slivers: <Widget>[
            _loadingListSliver,
            SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
            SliverAnimatedOpacity(
              opacity: controller.state == FilterDashboardState.success ? 1 : 0,
              duration: Duration(seconds: 1),
              sliver: _recommendedListSliver,
            ),
            SliverAnimatedOpacity(
              opacity: controller.state == FilterDashboardState.success ? 1 : 0,
              duration: Duration(seconds: 1),
              sliver: _titleStoreListSliver,
            ),
            SliverAnimatedOpacity(
              opacity: controller.state == FilterDashboardState.success ? 1 : 0,
              duration: Duration(seconds: 1),
              sliver: _storeListSliver,
            ),
            _emptyListSliver,
          ],
        ),
      ),
    );
  }
}
