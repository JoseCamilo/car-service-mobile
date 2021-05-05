import 'package:car_service_mobile/screens/home/widgets/banner_promotions/banner_promotions_service.dart';
import 'package:car_service_mobile/shared/models/promotion_model.dart';
import 'package:flutter/material.dart';

import '../../home_state.dart';

class BannerPromotionsController {
  ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  List<PromotionModel> promotions;

  final service = BannerPromotionsService();

  void getPromotions() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    promotions = await service.getPromotions();
    state = HomeState.success;
  }
}
