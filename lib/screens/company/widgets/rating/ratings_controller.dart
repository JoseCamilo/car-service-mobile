import 'package:car_service_mobile/screens/company/company_page.dart';
import 'package:car_service_mobile/shared/models/rating_model.dart';
import 'package:car_service_mobile/shared/services/rating_service.dart';
import 'package:flutter/material.dart';

class RatingsController {
  ValueNotifier<CompanyState> stateNotifier =
      ValueNotifier<CompanyState>(CompanyState.empty);
  set state(CompanyState state) => stateNotifier.value = state;
  CompanyState get state => stateNotifier.value;

  List<RatingModel> ratings;

  final service = RatingService();

  void getRatings(String companyId) async {
    state = CompanyState.loading;
    ratings = await service.getRatings(companyId);
    state = CompanyState.success;
  }

  Future<void> sendRating({
    String companyId,
    String userName,
    String comment,
    int stars,
  }) async {
    state = CompanyState.loading;
    await service.sendRating(
      companyId: companyId,
      userName: userName,
      comment: comment,
      stars: stars,
    );
    state = CompanyState.success;
  }
}
