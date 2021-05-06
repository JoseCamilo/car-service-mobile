import 'package:car_service_mobile/screens/filter_dashboard/filter_dashboard_controller.dart';
import 'package:car_service_mobile/screens/filter_dashboard/widgets/filter_dashboard_widget.dart';
import 'package:car_service_mobile/shared/widgets/banner_carousel_widget.dart';
import 'package:car_service_mobile/shared/widgets/banner_list_widget.dart';
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
  List<ItemBannerListWidget> _storeList = [];
  List<ItemBannerCarouselWidget> _recomendedList = [];

  final controller = FilterDashboardController();
  @override
  void initState() {
    super.initState();
    controller.getCompanies(this.widget.subscription);
    controller.stateNotifier.addListener(() {
      setState(() {
        _storeList = controller.storeList;
        _recomendedList = controller.recomendedList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FilterDashboardWidget(
      title: this.widget.title,
      recomendedList: this._recomendedList,
      storeList: this._storeList,
    );
  }
}
