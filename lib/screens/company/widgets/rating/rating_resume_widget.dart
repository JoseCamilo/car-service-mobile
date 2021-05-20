import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingResumeWidget extends StatelessWidget {
  final RatingCompanyModel rating;

  const RatingResumeWidget({
    Key key,
    this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _ratingWidgetColumn = Column();

    if (rating != null) {
      _ratingWidgetColumn = Column(
        children: [
          Text(
            '${rating.stars.toString().replaceAll('.', ',')}',
            style: TextStyle(
              color: Colors.amber[700],
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SmoothStarRating(
            rating: rating.stars,
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
            '${rating.ratings}',
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
