import 'package:car_service_mobile/screens/home/widgets/special_offers/special_offers_service.dart';
import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:flutter/material.dart';

import '../../home_state.dart';

class SpecialOffersController {
  ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  List<CompanyModel> companies;

  final service = SpecialOffersService();

  void getOffers() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    companies = await service.getOffers();
    state = HomeState.success;
  }
}
