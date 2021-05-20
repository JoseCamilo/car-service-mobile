import 'package:car_service_mobile/screens/company/widgets/details/details_widget.dart';
import 'package:car_service_mobile/screens/company/widgets/rating/ratings_widget.dart';
import 'package:car_service_mobile/screens/company/widgets/services/services_widget.dart';
import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:flutter/material.dart';

class TabsBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        TabBar(
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
                'Avaliações',
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
    return TabBarView(
      children: <Widget>[
        ServicesWidget(
          services: company.services,
          servicesRecommended: company.servicesRecommended,
        ),
        RatingsWidget(
          companyKey: company.id,
          rating: company.rating,
          companyTitle: company.title,
        ),
        DetailsWidget(
          company: company,
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
