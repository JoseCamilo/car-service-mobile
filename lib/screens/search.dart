import 'package:car_service_mobile/components/banner_carousel.dart';
import 'package:car_service_mobile/components/banner_list.dart';
import 'package:car_service_mobile/models/database.dart';
import 'package:car_service_mobile/screens/company.dart';
import 'package:flutter/material.dart';

class SearchBuilderNavigator extends StatelessWidget {
  const SearchBuilderNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'search',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'search':
            return MaterialPageRoute(
                builder: (context) => Search(), settings: settings);
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

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    List<ItemBannerList> listBanner = DataBase().listBanner;
    List<ItemBannerCarousel> recomendedList = DataBase().recomendedList;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  labelText: 'Pesquisar',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 8.0),
              child: Text(
                'Lojas disponvieis',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  child: listBanner[index],
                );
              },
              childCount: listBanner.length,
            ),
          ),
        ],
      ),
    );
  }
}
