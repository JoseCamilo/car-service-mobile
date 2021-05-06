import 'package:car_service_mobile/shared/widgets/banner_carousel_widget.dart';
import 'package:car_service_mobile/shared/widgets/banner_list_widget.dart';
import 'package:flutter/material.dart';

class FilterDashboardWidget extends StatefulWidget {
  final String title;
  final List<ItemBannerListWidget> storeList;
  final List<ItemBannerCarouselWidget> recomendedList;

  const FilterDashboardWidget({
    Key key,
    this.title,
    @required this.storeList,
    @required this.recomendedList,
  }) : super(key: key);

  @override
  _FilterDashboardWidgetState createState() => _FilterDashboardWidgetState();
}

class _FilterDashboardWidgetState extends State<FilterDashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.title,
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
                  BannerCarouselWidget(listBanner: this.widget.recomendedList),
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
                  child: this.widget.storeList[index],
                );
              },
              childCount: this.widget.storeList.length,
            ),
          ),
        ],
      ),
    );
  }
}
