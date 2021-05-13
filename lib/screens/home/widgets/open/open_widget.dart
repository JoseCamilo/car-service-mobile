import 'package:car_service_mobile/screens/home/widgets/open/open_controller.dart';
import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:car_service_mobile/shared/widgets/banner_carousel_widget.dart';
import 'package:flutter/material.dart';

import '../../home_state.dart';

class OpenWidget extends StatefulWidget {
  @override
  _OpenWidgetState createState() => _OpenWidgetState();
}

class _OpenWidgetState extends State<OpenWidget> {
  final _controller = OpenController();
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
        title: 'Aberto agora',
        listBanner: _bannerList,
      );
    } else {
      return BannerCarouselLoadingWidget(
        title: 'Aberto agora',
      );
    }
  }
}
