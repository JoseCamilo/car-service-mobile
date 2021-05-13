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
  final List<dynamic> tags;

  CompanyModel(this.title, this.subtitle, this.assetImage, this.description,
      this.sale, this.stars, this.ratings, this.subscription, this.tags);

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
      'tags': tags,
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
      List<dynamic>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source));
}
