import 'package:car_service_mobile/shared/models/screen_arguments.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class BannerCarouselWidget extends StatelessWidget {
  final List<ItemBannerCarouselWidget> listBanner;
  final String title;

  BannerCarouselWidget({
    @required this.listBanner,
    this.title = '',
  }) : assert(listBanner != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 8.0),
          child: Text(
            this.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.37,
                  viewportFraction: 0.75,
                  enableInfiniteScroll: false,
                ),
                items: this.listBanner.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.02,
                      ),
                      child: card,
                    );
                  });
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ItemBannerCarouselWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetImage;
  final String sale;
  final String description;
  final String stars;
  final String ratings;

  ItemBannerCarouselWidget({
    @required this.title,
    this.subtitle = '',
    this.assetImage = '',
    this.sale = '',
    this.description = '',
    this.stars = '',
    this.ratings = '',
  }) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () => _showCompany(
          context: context,
          name: this.title,
          image: this.assetImage,
          description: this.description,
          address: this.subtitle,
          sale: this.sale,
          stars: this.stars,
          ratings: this.ratings,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.73,
                  child: Stack(
                    children: [
                      Visibility(
                        visible: this.assetImage.isNotEmpty &&
                            this.assetImage.contains('http'),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.73,
                          child: ClipRRect(
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/loading1.gif',
                              image: this.assetImage,
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: this.sale.isNotEmpty,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.0)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      this.sale,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: this.stars.isNotEmpty,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.19,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.0)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        this.stars,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '$ratings avaliações',
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 8.0, left: MediaQuery.of(context).size.width * 0.02),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      this.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: subtitle.isNotEmpty,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.0,
                      left: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        this.subtitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showCompany({
    BuildContext context,
    String name,
    String image,
    String description,
    String address,
    String sale,
    String stars,
    String ratings,
  }) {
    Navigator.of(context).pushNamed(
      'company',
      arguments: ScreenArguments(
        title: name,
        image: image,
        description: description,
        address: address,
        sale: sale,
        stars: stars,
        ratings: ratings,
      ),
    );
  }
}

class BannerCarouselLoadingWidget extends StatelessWidget {
  final List<ItemBannerCarouselLoadingWidget> listBanner = [
    new ItemBannerCarouselLoadingWidget(),
    new ItemBannerCarouselLoadingWidget(),
  ];
  final String title;

  BannerCarouselLoadingWidget({this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 8.0),
          child: Text(
            this.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.37,
                  viewportFraction: 0.75,
                  enableInfiniteScroll: false,
                ),
                items: this.listBanner.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.02,
                      ),
                      child: card,
                    );
                  });
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ItemBannerCarouselLoadingWidget extends StatelessWidget {
  ItemBannerCarouselLoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
          ),
          child: SkeletonAnimation(
            child: Container(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 20,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
          ),
          child: SkeletonAnimation(
            child: Container(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 20,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
          ),
          child: SkeletonAnimation(
            child: Container(),
          ),
        ),
      ],
    );
  }
}
