import 'package:car_service_mobile/screens/filter_dashboard/filter_dashboard_page.dart';
import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:car_service_mobile/shared/services/company_service.dart';
import 'package:car_service_mobile/shared/widgets/banner_carousel_widget.dart';
import 'package:car_service_mobile/shared/widgets/banner_list_widget.dart';
import 'package:flutter/material.dart';

class FilterDashboardController {
  ValueNotifier<FilterDashboardState> stateNotifier =
      ValueNotifier<FilterDashboardState>(FilterDashboardState.empty);
  set state(FilterDashboardState state) => stateNotifier.value = state;
  FilterDashboardState get state => stateNotifier.value;

  List<CompanyModel> companies;

  List<ItemBannerListWidget> storeList = [];
  List<ItemBannerCarouselWidget> recomendedList = [];

  final service = CompanyService();

  void getCompanies(subscription) async {
    state = FilterDashboardState.loading;
    companies = await service.getCompanies(subscription: subscription);
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
      if (companies[i].subscription.contains('RECOMMENDED')) {
        recomendedList.add(
          ItemBannerCarouselWidget(
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
    }
    if (companies.length > 0) {
      state = FilterDashboardState.success;
    } else {
      state = FilterDashboardState.empty;
    }
  }
}
