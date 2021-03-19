import 'package:car_service_mobile/models/screen_arguments.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatelessWidget {
  final List<ItemBannerCarousel> listBanner;

  BannerCarousel({
    @required this.listBanner,
  }) : assert(listBanner != null);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.37,
        viewportFraction: 0.75,
        enableInfiniteScroll: false,
      ),
      items: listBanner.map((card) {
        return Builder(builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.02,
            ),
            child: card,
          );
        });
      }).toList(),
    );
  }
}

class ItemBannerCarousel extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetImage;
  final String sale;
  final String description;
  final String stars;
  final String ratings;

  ItemBannerCarousel({
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
            Visibility(
              visible: this.assetImage.isNotEmpty,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.73,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      image: DecorationImage(
                        image: AssetImage(this.assetImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
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
                              height: MediaQuery.of(context).size.height * 0.07,
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
                  ),
                ],
              ),
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
