import 'package:car_service_mobile/components/banner_carousel.dart';
import 'package:car_service_mobile/components/banner_list.dart';
import 'package:car_service_mobile/models/database.dart';
import 'package:flutter/material.dart';

class FilterOil extends StatefulWidget {
  @override
  _FilterOilState createState() => _FilterOilState();
}

class _FilterOilState extends State<FilterOil> {
  final String titleScreen = 'Óleo';

  @override
  Widget build(BuildContext context) {
    List<ItemBannerList> listBanner = DataBase().listBanner;
    List<ItemBannerCarousel> recomendedList = DataBase().recomendedList;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleScreen,
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: GestureDetector(
          child:
              Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 8.0),
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
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
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
