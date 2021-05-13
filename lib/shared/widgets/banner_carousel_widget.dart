import 'package:car_service_mobile/shared/models/company_model.dart';
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
  final CompanyModel company;

  ItemBannerCarouselWidget({@required this.company});

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
          company: this.company,
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
                        visible: this.company.assetImage[0].isNotEmpty &&
                            this.company.assetImage[0].contains('http'),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.73,
                          child: ClipRRect(
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/loading1.gif',
                              image: this.company.assetImage[0],
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
                            visible: this.company.sale.isNotEmpty,
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
                                      this.company.sale,
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
                            visible: this.company.stars != null,
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 3),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                      Text(
                                        this
                                            .company
                                            .stars
                                            .toString()
                                            .replaceAll('.', ','),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '/5',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
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
                      this.company.title,
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
              visible: this.company.subtitle.isNotEmpty,
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
                        this.company.subtitle,
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
    CompanyModel company,
  }) {
    Navigator.of(context).pushNamed(
      'company',
      arguments: company,
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
