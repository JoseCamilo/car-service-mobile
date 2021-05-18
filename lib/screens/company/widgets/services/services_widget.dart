import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:car_service_mobile/shared/widgets/services_company_widget.dart';
import 'package:flutter/material.dart';

class ServicesWidget extends StatelessWidget {
  final List<ServiceCompanyModel> services;
  final List<ServiceCompanyModel> servicesRecommended;

  const ServicesWidget({Key key, this.services, this.servicesRecommended})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget _servicesBuild;
    List<Widget> _servicesBuildItems = [];

    if (servicesRecommended.length > 0) {
      _servicesBuildItems.add(Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
        child: Text(
          'Destaques',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ));

      for (var i = 0; i < servicesRecommended.length; i++) {
        _servicesBuildItems.add(ItemServicesCompanyWidget(
          title: servicesRecommended[i].title,
          description: servicesRecommended[i].description,
          time: servicesRecommended[i].time,
          price: servicesRecommended[i].price,
          offer: servicesRecommended[i].offer,
        ));
      }

      _servicesBuildItems.add(SizedBox(
        height: 32,
      ));
    }

    if (services.length > 0) {
      _servicesBuildItems.add(Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
        child: Text(
          'Serviços',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ));

      for (var i = 0; i < services.length; i++) {
        _servicesBuildItems.add(ItemServicesCompanyWidget(
          title: services[i].title,
          description: services[i].description,
          time: services[i].time,
          price: services[i].price,
          offer: services[i].offer,
        ));
      }
    }

    _servicesBuild = ListView(
      physics: NeverScrollableScrollPhysics(),
      children: _servicesBuildItems,
    );

    return _servicesBuild;
  }
}
