import 'package:car_service_mobile/shared/widgets/banner_carousel_widget.dart';
import 'package:car_service_mobile/shared/widgets/banner_list_widget.dart';
import 'package:car_service_mobile/shared/models/database.dart';
import 'package:flutter/material.dart';

class FilterMechanics extends StatefulWidget {
  @override
  _FilterMechanicsState createState() => _FilterMechanicsState();
}

class _FilterMechanicsState extends State<FilterMechanics> {
  final String titleScreen = 'Mecânica';

  @override
  Widget build(BuildContext context) {
    List<ItemBannerListWidget> listBanner = DataBase().listBannerMec;
    List<ItemBannerCarouselWidget> recomendedList =
        DataBase().recomendedListMec;

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
