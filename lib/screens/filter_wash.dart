import 'package:car_service_mobile/shared/widgets/banner_carousel_widget.dart';
import 'package:car_service_mobile/shared/widgets/banner_list_widget.dart';
import 'package:car_service_mobile/shared/models/database.dart';
import 'package:flutter/material.dart';

class FilterWash extends StatefulWidget {
  @override
  _FilterWashState createState() => _FilterWashState();
}

class _FilterWashState extends State<FilterWash> {
  final String titleScreen = 'Lavagem';

  @override
  Widget build(BuildContext context) {
    List<ItemBannerListWidget> listBanner = DataBase().listBannerLava;
    List<ItemBannerCarouselWidget> recomendedList =
        DataBase().recomendedListLavagem;
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
                'Destaques',
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
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                'Lojas disponíveis',
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
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
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
