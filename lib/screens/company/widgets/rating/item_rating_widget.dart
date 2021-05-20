import 'package:car_service_mobile/shared/models/rating_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ItemRatingWidget extends StatelessWidget {
  final RatingModel rating;

  const ItemRatingWidget({Key key, @required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FaIcon(
                FontAwesomeIcons.userCircle,
                color: Colors.black54,
                size: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.rating.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    SmoothStarRating(
                      rating: this.rating.stars.toDouble(),
                      isReadOnly: true,
                      size: 14,
                      filledIconData: Icons.star,
                      halfFilledIconData: Icons.star_half,
                      defaultIconData: Icons.star_border,
                      starCount: 5,
                      allowHalfRating: true,
                      color: Colors.amber[700],
                      borderColor: Colors.amber[700],
                    ),
                    Text(
                      this.rating.date,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    this.rating.comment,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Divider(
              color: Colors.black12,
              height: 0,
              thickness: 2,
              indent: 0,
              endIndent: 0,
            ),
          ),
        ],
      ),
    );
  }
}
