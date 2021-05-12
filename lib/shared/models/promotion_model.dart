import 'dart:convert';

class PromotionModel {
  final String title;
  final String subtitle;
  final String assetImage;
  final String subscription;
  final int index;

  PromotionModel(this.title, this.subtitle, this.assetImage, this.subscription,
      this.index);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'assetImage': assetImage,
      'subscription': subscription,
      'index': index,
    };
  }

  factory PromotionModel.fromMap(Map<String, dynamic> map) {
    return PromotionModel(
      map['title'],
      map['subtitle'],
      map['assetImage'],
      map['subscription'],
      map['index'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PromotionModel.fromJson(String source) =>
      PromotionModel.fromMap(json.decode(source));
}
