import 'dart:convert';

class CompanyModel {
  final String title;
  final String subtitle;
  final String assetImage;
  final String description;
  final String sale;
  final double stars;
  final int ratings;
  final List<dynamic> subscription;

  CompanyModel(this.title, this.subtitle, this.assetImage, this.description,
      this.sale, this.stars, this.ratings, this.subscription);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'assetImage': assetImage,
      'description': description,
      'sale': sale,
      'stars': stars,
      'ratings': ratings,
      'subscription': subscription,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      map['title'],
      map['subtitle'],
      map['assetImage'],
      map['description'],
      map['sale'],
      map['stars'],
      map['ratings'],
      List<dynamic>.from(map['subscription']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source));
}
