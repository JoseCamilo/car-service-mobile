import 'package:car_service_mobile/components/banner_carousel.dart';
import 'package:car_service_mobile/components/carousel.dart';
import 'package:car_service_mobile/components/dashboard.dart';
import 'package:car_service_mobile/models/database.dart';
import 'package:car_service_mobile/screens/company.dart';
import 'package:car_service_mobile/screens/filter_body.dart';
import 'package:car_service_mobile/screens/filter_eletric.dart';
import 'package:car_service_mobile/screens/filter_mechanics.dart';
import 'package:car_service_mobile/screens/filter_oil.dart';
import 'package:car_service_mobile/screens/filter_tire.dart';
import 'package:car_service_mobile/screens/filter_wash.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  int _currentIndex = 0;
  List carouselList = [
    ItemCarousel(
      title: 'Lavagem em casa depois',
      subtitle: 'em casa',
      assetImage: 'assets/flutter_dev.png',
      onClick: () => {},
      colors: [
        Color(0xffff4000),
        Color(0xffffcc66),
      ],
    ),
    ItemCarousel(
      title: 'Troca Grátis',
      subtitle: 'de óleo',
      assetImage: 'assets/flutter_dev.png',
      onClick: () => {},
      colors: [
        Color(0xFF008AC6),
        Color(0xFF00BFFF),
      ],
    ),
    ItemCarousel(
      title: 'Leva e Trás',
      assetImage: 'assets/flutter_dev.png',
      onClick: () => {},
      colors: [
        Color(0xFFDD1800),
        Color(0xFFFF5F37),
      ],
    ),
    ItemCarousel(
      title: 'Ajustes',
      subtitle: 'grátis',
      assetImage: 'assets/flutter_dev.png',
      onClick: () => {},
      colors: [
        Color(0xff5f2c82),
        Color(0xff49a09d),
      ],
    ),
  ];

  List<ItemBannerCarousel> recomendedList = DataBase().recomendedList;

  @override
  Widget build(BuildContext context) {
    List<ItemDashboard> dashboardGridHome = [
      ItemDashboard(
        title: 'Lavagem',
        icon: Icons.auto_awesome,
        onClick: () => _showWash(context),
      ),
      ItemDashboard(
        title: 'Pneu',
        icon: Icons.album_outlined,
        onClick: () => _showTire(context),
      ),
      ItemDashboard(
        title: 'Óleo',
        icon: Icons.invert_colors_on_outlined,
        onClick: () => _showOil(context),
      ),
      ItemDashboard(
        title: 'Elétrica',
        icon: Icons.flash_on_outlined,
        onClick: () => _showEletric(context),
      ),
      ItemDashboard(
        title: 'Mecânica',
        icon: Icons.build_outlined,
        onClick: () => _showMechanics(context),
      ),
      ItemDashboard(
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
                    image: AssetImage('assets/car_service_logo.jpg'),
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
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
              child: Column(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 150.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 6),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 1.5,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: carouselList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: card,
                          ),
                        );
                      });
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(carouselList, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Theme.of(context).accentColor
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8.0),
              child: Text(
                'Ofertas especiais',
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
                  BannerCarousel(listBanner: recomendedList),
                ],
              ),
            ),
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
                  BannerCarousel(listBanner: recomendedList),
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
                  BannerCarousel(listBanner: recomendedList),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
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
