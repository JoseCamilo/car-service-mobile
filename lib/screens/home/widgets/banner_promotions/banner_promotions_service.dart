import 'dart:convert';

import 'package:car_service_mobile/shared/models/promotion_model.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class BannerPromotionsService {
  Future<List<PromotionModel>> getPromotions() async {
    final client = RetryClient(http.Client());
    final url =
        Uri.parse('http://mobademocs-464e.restdb.io/rest/banner-home-carousel');
    final Map<String, String> headers = {
      'x-apikey': '70b0bc03677bc2e4b56c730aa873a09c34c71'
    };

    try {
      final response = await client.read(url, headers: headers);
      // final response = await rootBundle
      //     .loadString('assets/database/banner_home_carousel.json');
      final list = jsonDecode(response) as List;
      for (var i = 0; i < list.length; i++) {
        list[i]["index"] = i;
      }
      final result = list.map((e) => PromotionModel.fromMap(e)).toList();
      return result;
    } finally {
      client.close();
    }
  }
}
