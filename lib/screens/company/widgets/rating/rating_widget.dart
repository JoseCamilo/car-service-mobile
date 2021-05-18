import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingWidget extends StatelessWidget {
  final double stars;
  final int ratings;

  const RatingWidget({Key key, this.stars, this.ratings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _ratingWidgetColumn = Column();

    if (stars != null) {
      _ratingWidgetColumn = Column(
        children: [
          Text(
            '${stars.toString().replaceAll('.', ',')}',
            style: TextStyle(
              color: Colors.amber[700],
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SmoothStarRating(
            rating: stars,
            isReadOnly: false,
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
            '$ratings',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    return _ratingWidgetColumn;
  }
}
