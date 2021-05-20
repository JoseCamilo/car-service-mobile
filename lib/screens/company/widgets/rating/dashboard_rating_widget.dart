import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:car_service_mobile/shared/models/rating_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DashboardRatingWidget extends StatelessWidget {
  final List<RatingModel> ratings;
  final RatingCompanyModel rating;

  const DashboardRatingWidget({
    Key key,
    @required this.ratings,
    @required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        this.rating.stars.toString().replaceAll('.', ','),
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '/5',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SmoothStarRating(
                    rating: this.rating.stars,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${rating.ratings}'),
                      SizedBox(width: 4),
                      Text('avaliações'),
                    ],
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: Colors.black12,
              thickness: 2,
              indent: 0,
              endIndent: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('1'),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Icon(
                          Icons.star,
                          color: Colors.black54,
                          size: 14,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: LinearProgressIndicator(
                          value: rating.oneStars / rating.ratings,
                          backgroundColor: Colors.black12,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.amber[700]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text('${rating.oneStars}'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('2'),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Icon(
                          Icons.star,
                          color: Colors.black54,
                          size: 14,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: LinearProgressIndicator(
                          value: rating.twoStars / rating.ratings,
                          backgroundColor: Colors.black12,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.amber[700]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text('${rating.twoStars}'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('3'),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Icon(
                          Icons.star,
                          color: Colors.black54,
                          size: 14,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: LinearProgressIndicator(
                          value: rating.threeStars / rating.ratings,
                          backgroundColor: Colors.black12,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.amber[700]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text('${rating.threeStars}'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('4'),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Icon(
                          Icons.star,
                          color: Colors.black54,
                          size: 14,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: LinearProgressIndicator(
                          value: rating.fourStars / rating.ratings,
                          backgroundColor: Colors.black12,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.amber[700]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text('${rating.fourStars}'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('5'),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Icon(
                          Icons.star,
                          color: Colors.black54,
                          size: 14,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: LinearProgressIndicator(
                          value: rating.fiveStars / rating.ratings,
                          backgroundColor: Colors.black12,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.amber[700]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text('${rating.fiveStars}'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
