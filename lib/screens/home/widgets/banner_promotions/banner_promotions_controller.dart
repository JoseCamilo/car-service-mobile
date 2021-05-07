import 'package:car_service_mobile/shared/models/promotion_model.dart';
import 'package:car_service_mobile/shared/services/company_service.dart';
import 'package:flutter/material.dart';

import '../../home_state.dart';

class BannerPromotionsController {
  ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  List<PromotionModel> promotions;

  final service = CompanyService();

  void getPromotions() async {
    state = HomeState.loading;
    promotions = await service.getPromotions();
    state = HomeState.success;
  }
}
