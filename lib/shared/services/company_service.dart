import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyService {
  CollectionReference _companiesRef =
      FirebaseFirestore.instance.collection('companies');

  Future<List<CompanyModel>> getCompaniesQuery({String query = ''}) async {
    QuerySnapshot querySnapshot = await _companiesRef.get();
    final List<Map<String, dynamic>> allData = querySnapshot.docs.map((doc) {
      final Map<String, dynamic> element = doc.data();
      element['id'] = doc.id;
      return element;
    }).toList();

    for (var i = 0; i < allData.length; i++) {
      allData[i]["index"] = i;
    }
    final result = allData.map((e) => CompanyModel.fromMap(e)).toList();
    return result;
  }

  Future<List<CompanyModel>> getCompaniesSubscription(
      {String subscription = ''}) async {
    QuerySnapshot querySnapshot = await _companiesRef
        .where('subscription', arrayContains: subscription)
        .get();
    final List<Map<String, dynamic>> allData = querySnapshot.docs.map((doc) {
      final Map<String, dynamic> element = doc.data();
      element['id'] = doc.id;
      return element;
    }).toList();

    for (var i = 0; i < allData.length; i++) {
      allData[i]["index"] = i;
    }
    final result = allData.map((e) => CompanyModel.fromMap(e)).toList();
    return result;
  }
}
