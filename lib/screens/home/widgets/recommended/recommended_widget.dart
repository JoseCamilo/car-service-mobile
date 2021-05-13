import 'package:car_service_mobile/screens/home/widgets/recommended/recommended_controller.dart';
import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:car_service_mobile/shared/widgets/banner_carousel_widget.dart';
import 'package:flutter/material.dart';

import '../../home_state.dart';

class RecommendedWidget extends StatefulWidget {
  @override
  _RecommendedWidgetState createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  final _controller = RecommendedController();
  List<ItemBannerCarouselWidget> _bannerList = [];
  List<CompanyModel> _companyList = [];

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.getOffers();

    _controller.stateNotifier.addListener(() {
      setState(() {
        _companyList = _controller.companies;
        for (var i = 0; i < _companyList.length; i++) {
          _bannerList.add(
            new ItemBannerCarouselWidget(company: _companyList[i]),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.state == HomeState.success) {
      return BannerCarouselWidget(
        title: 'Recomendado para você',
        listBanner: _bannerList,
      );
    } else {
      return BannerCarouselLoadingWidget(
        title: 'Recomendado para você',
      );
    }
  }
}
