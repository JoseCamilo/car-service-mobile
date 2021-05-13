import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:car_service_mobile/shared/widgets/banner_carousel_widget.dart';
import 'package:car_service_mobile/screens/home/widgets/special_offers/special_offers_controller.dart';
import 'package:flutter/material.dart';

import '../../home_state.dart';

class SpecialOffersWidget extends StatefulWidget {
  @override
  _SpecialOffersWidgetState createState() => _SpecialOffersWidgetState();
}

class _SpecialOffersWidgetState extends State<SpecialOffersWidget> {
  final _controller = SpecialOffersController();
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
            new ItemBannerCarouselWidget(
              title: _companyList[i].title,
              subtitle: _companyList[i].subtitle,
              assetImage: _companyList[i].assetImage,
              sale: _companyList[i].sale,
              description: _companyList[i].description,
              stars: _companyList[i].stars.toString(),
              ratings: _companyList[i].ratings.toString(),
              tags: _companyList[i].tags,
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.state == HomeState.success) {
      return BannerCarouselWidget(
        title: 'Ofertas especiais',
        listBanner: _bannerList,
      );
    } else {
      return BannerCarouselLoadingWidget(
        title: 'Ofertas especiais',
      );
    }
  }
}
