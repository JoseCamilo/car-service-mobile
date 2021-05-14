import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:car_service_mobile/shared/services/company_service.dart';
import 'package:flutter/material.dart';

import '../../home_state.dart';

class OpenController {
  ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  List<CompanyModel> companies;

  final service = CompanyService();

  void getOffers() async {
    state = HomeState.loading;
    companies = await service.getCompaniesSubscription(subscription: 'OPEN');
    state = HomeState.success;
  }
}
