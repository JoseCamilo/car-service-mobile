import 'dart:convert';

class PromotionModel {
  final String title;
  final String subtitle;
  final String assetImage;
  final int index;

  PromotionModel(this.title, this.subtitle, this.assetImage, this.index);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'assetImage': assetImage,
      'index': index
    };
  }

  factory PromotionModel.fromMap(Map<String, dynamic> map) {
    return PromotionModel(
        map['title'], map['subtitle'], map['assetImage'], map['index']);
  }

  String toJson() => json.encode(toMap());

  factory PromotionModel.fromJson(String source) =>
      PromotionModel.fromMap(json.decode(source));
}
