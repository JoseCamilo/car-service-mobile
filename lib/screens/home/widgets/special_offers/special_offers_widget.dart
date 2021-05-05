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
  List<ItemBannerCarouselWidget> _saleList = [];
  List<CompanyModel> _companyList = [];

  final _controller = SpecialOffersController();
  @override
  void initState() {
    super.initState();
    _controller.getOffers();
    _controller.stateNotifier.addListener(() {
      setState(() {
        _companyList = _controller.companies;
        for (var i = 0; i < _companyList.length; i++) {
          _saleList.add(
            new ItemBannerCarouselWidget(
              title: _companyList[i].title,
              subtitle: _companyList[i].subtitle,
              assetImage: _companyList[i].assetImage,
              sale: _companyList[i].sale,
              description: _companyList[i].description,
              stars: _companyList[i].stars.toString(),
              ratings: _companyList[i].ratings.toString(),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.state == HomeState.success) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 8.0),
            child: Text(
              'Ofertas especiais',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: <Widget>[
                BannerCarouselWidget(listBanner: _saleList),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 8.0),
            child: Text(
              'Ofertas especiais',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: <Widget>[
                BannerCarouselLoadingWidget(),
              ],
            ),
          ),
        ],
      );
    }
  }
}
