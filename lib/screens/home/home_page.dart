import 'package:car_service_mobile/shared/widgets/banner_carousel_widget.dart';
import 'package:car_service_mobile/screens/home/widgets/dashboard/dashboard_widget.dart';
import 'package:car_service_mobile/screens/home/widgets/special_offers/special_offers_widget.dart';
import 'package:car_service_mobile/shared/models/database.dart';
import 'package:car_service_mobile/screens/company.dart';
import 'package:car_service_mobile/screens/filter_body.dart';
import 'package:car_service_mobile/screens/filter_eletric.dart';
import 'package:car_service_mobile/screens/filter_mechanics.dart';
import 'package:car_service_mobile/screens/filter_oil.dart';
import 'package:car_service_mobile/screens/filter_tire.dart';
import 'package:car_service_mobile/screens/filter_wash.dart';
import 'package:car_service_mobile/screens/home/widgets/banner_promotions/banner_promotions_widget.dart';
import 'package:flutter/material.dart';

class HomeBuilderNavigator extends StatelessWidget {
  const HomeBuilderNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'home',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'home':
            return MaterialPageRoute(
                builder: (context) => Home(), settings: settings);
            break;

          case 'filter-wash':
            return MaterialPageRoute(
                builder: (context) => FilterWash(), settings: settings);
            break;

          case 'filter-tire':
            return MaterialPageRoute(
                builder: (context) => FilterTire(), settings: settings);
            break;

          case 'filter-oil':
            return MaterialPageRoute(
                builder: (context) => FilterOil(), settings: settings);
            break;

          case 'filter-eletric':
            return MaterialPageRoute(
                builder: (context) => FilterEletric(), settings: settings);
            break;

          case 'filter-mechanics':
            return MaterialPageRoute(
                builder: (context) => FilterMechanics(), settings: settings);
            break;

          case 'filter-body':
            return MaterialPageRoute(
                builder: (context) => FilterBody(), settings: settings);
            break;

          case 'company':
            return MaterialPageRoute(
                builder: (context) => Company(), settings: settings);
            break;

          default:
            throw Exception("Invalid route");
        }
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ItemBannerCarouselWidget> recomendedList = DataBase().recomendedList;
  List<ItemBannerCarouselWidget> openedList = DataBase().openedList;

  @override
  Widget build(BuildContext context) {
    List<ItemDashboardWidget> dashboardGridHome = [
      ItemDashboardWidget(
        title: 'Lavagem',
        icon: Icons.auto_awesome,
        onClick: () => _showWash(context),
      ),
      ItemDashboardWidget(
        title: 'Pneu',
        icon: Icons.album_outlined,
        onClick: () => _showTire(context),
      ),
      ItemDashboardWidget(
        title: 'Óleo',
        icon: Icons.invert_colors_on_outlined,
        onClick: () => _showOil(context),
      ),
      ItemDashboardWidget(
        title: 'Elétrica',
        icon: Icons.flash_on_outlined,
        onClick: () => _showEletric(context),
      ),
      ItemDashboardWidget(
        title: 'Mecânica',
        icon: Icons.build_outlined,
        onClick: () => _showMechanics(context),
      ),
      ItemDashboardWidget(
        title: 'Funilaria',
        icon: Icons.auto_fix_high,
        onClick: () => _showBody(context),
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image(
                    image: AssetImage('assets/images/car_service_logo.jpg'),
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 3),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x70000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 1.5,
              crossAxisCount: 3,
            ),
            delegate: SliverChildListDelegate(
              dashboardGridHome,
            ),
          ),
          SliverToBoxAdapter(
            child: BannerPromotionsWidget(),
          ),
          SliverToBoxAdapter(
            child: SpecialOffersWidget(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8.0),
              child: Text(
                'Recomendado para você',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                children: <Widget>[
                  BannerCarouselWidget(listBanner: recomendedList),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8.0),
              child: Text(
                'Aberto agora',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                children: <Widget>[
                  BannerCarouselWidget(listBanner: openedList),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showWash(BuildContext context) {
  Navigator.of(context).pushNamed('filter-wash');
}

void _showTire(BuildContext context) {
  Navigator.of(context).pushNamed('filter-tire');
}

void _showOil(BuildContext context) {
  Navigator.of(context).pushNamed('filter-oil');
}

void _showEletric(BuildContext context) {
  Navigator.of(context).pushNamed('filter-eletric');
}

void _showMechanics(BuildContext context) {
  Navigator.of(context).pushNamed('filter-mechanics');
}

void _showBody(BuildContext context) {
  Navigator.of(context).pushNamed('filter-body');
}
