import 'package:car_service_mobile/screens/home/widgets/banner_promotions/item_banner_promotions_widget.dart';
import 'package:car_service_mobile/screens/home/widgets/banner_promotions/banner_promotions_controller.dart';
import 'package:car_service_mobile/shared/models/promotion_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../home_state.dart';

class BannerPromotionsWidget extends StatefulWidget {
  @override
  _BannerPromotionsWidgetState createState() => _BannerPromotionsWidgetState();
}

class _BannerPromotionsWidgetState extends State<BannerPromotionsWidget> {
  final controller = BannerPromotionsController();
  int _currentIndex = 0;
  List<PromotionModel> _carouselList = [];

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    controller.getPromotions();
    controller.stateNotifier.addListener(() {
      setState(() {
        _carouselList = controller.promotions;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Padding(
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
              items: _carouselList.map((item) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: ItemBannerPromotionsWidget(
                        title: item.title,
                        subtitle: item.subtitle,
                        assetImage: item.assetImage,
                        onClick: () => {
                          Navigator.of(context).pushNamed(
                            'filter-dashboard',
                            arguments: {
                              'title': '${item.title} ${item.subtitle}',
                              'subscription': item.subscription,
                            },
                          ),
                        },
                        color: item.index,
                      ),
                    ),
                  );
                });
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(_carouselList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
        child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 150.0,
                autoPlay: false,
                aspectRatio: 1.5,
              ),
              items: ['', '', ''].map((item) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: ItemBannerPromotionsLoadingWidget(),
                    ),
                  );
                });
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(['', '', ''], (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                );
              }),
            ),
          ],
        ),
      );
    }
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
