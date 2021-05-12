import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:skeleton_text/skeleton_text.dart';

class ItemBannerPromotionsWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetImage;
  final Function onClick;
  final int color;

  ItemBannerPromotionsWidget({
    @required this.title,
    this.subtitle = '',
    this.assetImage = '',
    this.color = 0,
    @required this.onClick,
  })  : assert(title != null),
        assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: _colorsCarousel[this.color],
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        onTap: this.onClick,
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.30,
                    child: Text(this.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  Visibility(
                    visible: this.subtitle.isNotEmpty,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Text(this.subtitle,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                    visible: this.assetImage.isNotEmpty,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: this.assetImage,
                      fit: BoxFit.cover,
                      height: 140,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemBannerPromotionsLoadingWidget extends StatelessWidget {
  ItemBannerPromotionsLoadingWidget();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
            ),
            child: SkeletonAnimation(
              child: Container(),
            ),
          ),
        ),
      ],
    );
  }
}

final List _colorsCarousel = [
  [
    Color(0xffff4000),
    Color(0xffffcc66),
  ],
  [
    Color(0xFF008AC6),
    Color(0xFF00BFFF),
  ],
  [
    Color(0xFFDD1800),
    Color(0xFFFF5F37),
  ],
  [
    Color(0xff5f2c82),
    Color(0xff49a09d),
  ],
  [
    Color(0xFF008AC6),
    Color(0xFF00BFFF),
  ],
  [
    Color(0xFFDD1800),
    Color(0xFFFF5F37),
  ],
  [
    Color(0xff5f2c82),
    Color(0xff49a09d),
  ],
  [
    Color(0xFF008AC6),
    Color(0xFF00BFFF),
  ],
  [
    Color(0xFFDD1800),
    Color(0xFFFF5F37),
  ],
  [
    Color(0xff5f2c82),
    Color(0xff49a09d),
  ],
  [
    Color(0xFF008AC6),
    Color(0xFF00BFFF),
  ],
  [
    Color(0xFFDD1800),
    Color(0xFFFF5F37),
  ],
  [
    Color(0xff5f2c82),
    Color(0xff49a09d),
  ],
  [
    Color(0xFF008AC6),
    Color(0xFF00BFFF),
  ],
  [
    Color(0xFFDD1800),
    Color(0xFFFF5F37),
  ],
  [
    Color(0xff5f2c82),
    Color(0xff49a09d),
  ],
  [
    Color(0xFF008AC6),
    Color(0xFF00BFFF),
  ],
  [
    Color(0xFFDD1800),
    Color(0xFFFF5F37),
  ],
  [
    Color(0xff5f2c82),
    Color(0xff49a09d),
  ],
  [
    Color(0xFF008AC6),
    Color(0xFF00BFFF),
  ],
  [
    Color(0xFFDD1800),
    Color(0xFFFF5F37),
  ],
  [
    Color(0xff5f2c82),
    Color(0xff49a09d),
  ],
];
