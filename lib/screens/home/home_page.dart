import 'package:car_service_mobile/screens/filter_dashboard/filter_dashboard_page.dart';
import 'package:car_service_mobile/screens/home/widgets/open/open_widget.dart';
import 'package:car_service_mobile/screens/home/widgets/recommended/recommended_widget.dart';
import 'package:car_service_mobile/screens/home/widgets/dashboard/dashboard_widget.dart';
import 'package:car_service_mobile/screens/home/widgets/special_offers/special_offers_widget.dart';
import 'package:car_service_mobile/screens/company.dart';
import 'package:car_service_mobile/screens/home/widgets/banner_promotions/banner_promotions_widget.dart';
import 'package:flutter/material.dart';

class HomePageBuilderNavigator extends StatelessWidget {
  const HomePageBuilderNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'home',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'home':
            return MaterialPageRoute(
                builder: (context) => HomePage(), settings: settings);
            break;

          case 'filter-dashboard':
            final arguments = settings.arguments as Map;
            return MaterialPageRoute(
                builder: (context) => FilterDashboardPage(
                      title: arguments['title'],
                      subscription: arguments['subscription'],
                    ),
                settings: settings);
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
          DashboardWidget(),
          SliverToBoxAdapter(
            child: BannerPromotionsWidget(),
          ),
          SliverToBoxAdapter(
            child: SpecialOffersWidget(),
          ),
          SliverToBoxAdapter(
            child: RecommendedWidget(),
          ),
          SliverToBoxAdapter(
            child: OpenWidget(),
          ),
        ],
      ),
    );
  }
}
