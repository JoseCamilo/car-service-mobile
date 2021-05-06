import 'dart:convert';

import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:car_service_mobile/shared/models/promotion_model.dart';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class CompanyService {
  final client = RetryClient(http.Client());
  final Map<String, String> headers = {
    'x-apikey': '70b0bc03677bc2e4b56c730aa873a09c34c71'
  };

  Future<List<CompanyModel>> getCompanies(String subscription) async {
    final url = Uri.parse(
        'https://mobademocs-464e.restdb.io/rest/companies?q={"subscription":"$subscription"}');

    try {
      final response = await client.read(url, headers: headers);
      final list = jsonDecode(response) as List;
      for (var i = 0; i < list.length; i++) {
        list[i]["index"] = i;
      }
      final result = list.map((e) => CompanyModel.fromMap(e)).toList();
      return result;
    } finally {
      client.close();
    }
  }

  Future<List<PromotionModel>> getPromotions() async {
    final url =
        Uri.parse('http://mobademocs-464e.restdb.io/rest/banner-home-carousel');

    try {
      final response = await client.read(url, headers: headers);
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
