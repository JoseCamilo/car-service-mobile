import 'package:car_service_mobile/shared/models/promotion_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PromotionService {
  CollectionReference _promotionsRef =
      FirebaseFirestore.instance.collection('banner_home');

  Future<List<PromotionModel>> getPromotions() async {
    QuerySnapshot querySnapshot = await _promotionsRef.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    final list = []..addAll(allData);
    for (var i = 0; i < list.length; i++) {
      list[i]["index"] = i;
    }
    final result = list.map((e) => PromotionModel.fromMap(e)).toList();
    return result;
  }
}
