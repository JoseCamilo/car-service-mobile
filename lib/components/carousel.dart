import 'package:flutter/material.dart';

class ItemCarousel extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetImage;
  final Function onClick;
  final List<Color> colors;

  ItemCarousel({
    @required this.title,
    this.subtitle = '',
    this.assetImage = '',
    @required this.colors,
    @required this.onClick,
  })  : assert(title != null),
        assert(colors != null),
        assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: this.colors,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.226,
                child: Text(this.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold)),
              ),
              Visibility(
                visible: subtitle.isNotEmpty,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.226,
                  child: Text(this.subtitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
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
                child: Image.asset(
                  this.assetImage,
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
