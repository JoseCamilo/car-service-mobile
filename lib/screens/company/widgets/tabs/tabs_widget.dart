import 'package:car_service_mobile/screens/company/widgets/details/details_widget.dart';
import 'package:car_service_mobile/screens/company/widgets/services/services_widget.dart';
import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:flutter/material.dart';

class TabsBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: TabBar(
          tabs: [
            Tab(
              child: Text(
                'Serviços',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Detalhes',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabsViewWidget extends StatelessWidget {
  final CompanyModel company;

  const TabsViewWidget({
    Key key,
    @required this.company,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: TabBarView(
        children: <Widget>[
          ServicesWidget(
            services: company.services,
            servicesRecommended: company.servicesRecommended,
          ),
          DetailsWidget(
            company: company,
          ),
        ],
      ),
    );
  }
}
