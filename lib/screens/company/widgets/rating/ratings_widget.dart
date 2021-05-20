import 'package:car_service_mobile/screens/company/company_page.dart';
import 'package:car_service_mobile/screens/company/widgets/rating/dashboard_rating_widget.dart';
import 'package:car_service_mobile/screens/company/widgets/rating/item_rating_widget.dart';
import 'package:car_service_mobile/screens/company/widgets/rating/ratings_controller.dart';
import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:car_service_mobile/shared/models/rating_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RatingsWidget extends StatefulWidget {
  final String companyKey;
  final String companyTitle;
  final RatingCompanyModel rating;

  const RatingsWidget({
    Key key,
    @required this.companyKey,
    @required this.rating,
    @required this.companyTitle,
  }) : super(key: key);
  @override
  _RatingsWidgetState createState() => _RatingsWidgetState();
}

class _RatingsWidgetState extends State<RatingsWidget> {
  final controller = RatingsController();
  List<RatingModel> _ratings = [];

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    controller.getRatings(this.widget.companyKey);
    controller.stateNotifier.addListener(() {
      setState(() {
        _ratings = controller.ratings;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _ratingsBuildItems = [];

    if (controller.state == CompanyState.success) {
      if (_ratings.length > 0) {
        _ratingsBuildItems.add(DashboardRatingWidget(
          ratings: _ratings,
          rating: this.widget.rating,
        ));

        _ratingsBuildItems.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  children: <TextSpan>[
                    TextSpan(text: 'Você já visitou este Parceiro? '),
                    TextSpan(
                        text: 'Faça sua avaliação!',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushNamed(
                              'new-rating',
                              arguments: {
                                'id': widget.companyKey,
                                'title': widget.companyTitle,
                              },
                            );
                          }),
                  ],
                ),
              ),
            ],
          ),
        ));
        _ratingsBuildItems.add(SizedBox(
          height: 16,
        ));
        for (var i = 0; i < _ratings.length; i++) {
          _ratingsBuildItems.add(ItemRatingWidget(
            rating: _ratings[i],
          ));
        }
      } else {
        _ratingsBuildItems.add(Center(
          child: Text('Não existem avaliações!'),
        ));
        _ratingsBuildItems.add(SizedBox(
          height: 16,
        ));
        _ratingsBuildItems.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  children: <TextSpan>[
                    TextSpan(text: 'Você já visitou este Parceiro? '),
                    TextSpan(
                        text: 'Faça sua avaliação!',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushNamed(
                              'new-rating',
                              arguments: {
                                'id': widget.companyKey,
                                'title': widget.companyTitle,
                              },
                            );
                          }),
                  ],
                ),
              ),
            ],
          ),
        ));
      }
    } else {
      _ratingsBuildItems.add(Padding(
        padding: const EdgeInsets.only(top: 64),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ));
    }

    return ListView(
      physics: BouncingScrollPhysics(),
      children: _ratingsBuildItems,
    );
  }
}
