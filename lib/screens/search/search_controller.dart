import 'package:car_service_mobile/screens/search/search_page.dart';
import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:car_service_mobile/shared/services/company_service.dart';
import 'package:car_service_mobile/shared/widgets/banner_list_widget.dart';
import 'package:flutter/material.dart';

class SearchController {
  ValueNotifier<SearchState> stateNotifier =
      ValueNotifier<SearchState>(SearchState.empty);
  set state(SearchState state) => stateNotifier.value = state;
  SearchState get state => stateNotifier.value;

  List<CompanyModel> companies;

  List<ItemBannerListWidget> storeList = [];

  final service = CompanyService();

  void getCompanies() async {
    state = SearchState.loading;
    companies = await service.getCompanies();
    for (var i = 0; i < companies.length; i++) {
      storeList.add(
        ItemBannerListWidget(
          title: companies[i].title,
          subtitle: companies[i].subtitle,
          description: companies[i].description,
          assetImage: companies[i].assetImage,
          sale: companies[i].sale,
          ratings: companies[i].ratings.toString(),
          stars: companies[i].stars.toString(),
        ),
      );
    }
    if (companies.length > 0) {
      state = SearchState.success;
    } else {
      state = SearchState.empty;
    }
  }
}
