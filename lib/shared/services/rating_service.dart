import 'package:car_service_mobile/shared/models/rating_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RatingService {
  CollectionReference _ratingsRef =
      FirebaseFirestore.instance.collection('ratings');

  Future<List<RatingModel>> getRatings(String companyId) async {
    QuerySnapshot querySnapshot = await _ratingsRef
        .where('company', isEqualTo: companyId)
        // .where('checked', isEqualTo: true)
        .get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    final result = allData.map((e) => RatingModel.fromMap(e)).toList();
    return result;
  }

  Future<void> sendRating({
    String companyId,
    String userName,
    String comment,
    int stars,
  }) async {
    var now = DateTime.now();
    await _ratingsRef.add({
      'company': companyId,
      'checked': false,
      'stars': stars,
      'name': userName,
      'comment': comment,
      'date': '${now.day} de ${months[now.month]} de ${now.year}',
    });
  }
}

final List<String> months = [
  'zero',
  'jan',
  'fev',
  'mar',
  'abr',
  'mai',
  'jun',
  'jul',
  'ago',
  'set',
  'out',
  'nov',
  'dez',
];
