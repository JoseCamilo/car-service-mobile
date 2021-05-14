import 'dart:convert';

class CompanyModel {
  final String title;
  final String subtitle;
  final List<String> assetImage;
  final String description;
  final String sale;
  final double stars;
  final int ratings;
  final List<String> subscription;
  final List<String> tags;
  final List<ServiceCompanyModel> services;
  final List<ServiceCompanyModel> servicesRecommended;
  final String indexing;

  CompanyModel(
    this.title,
    this.subtitle,
    this.assetImage,
    this.description,
    this.sale,
    this.stars,
    this.ratings,
    this.subscription,
    this.tags,
    this.services,
    this.servicesRecommended,
    this.indexing,
  );

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
      'services': services,
      'servicesRecommended': servicesRecommended,
      'indexing': indexing,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    if (map['services'] == null) {
      map['services'] = [];
    }
    if (map['servicesRecommended'] == null) {
      map['servicesRecommended'] = [];
    }
    if (map['indexing'] == null) {
      map['indexing'] = '';
    }
    return CompanyModel(
      map['title'],
      map['subtitle'],
      List<String>.from(map['assetImage']),
      map['description'],
      map['sale'],
      map['stars'],
      map['ratings'],
      List<String>.from(map['subscription']),
      List<String>.from(map['tags']),
      List<ServiceCompanyModel>.from(
        map['services'].map((x) => ServiceCompanyModel.fromMap(x)),
      ),
      List<ServiceCompanyModel>.from(
        map['servicesRecommended'].map((x) => ServiceCompanyModel.fromMap(x)),
      ),
      map['indexing'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source));
}

class ServiceCompanyModel {
  final String title;
  final String description;
  final String time;
  final String price;
  final String offer;

  ServiceCompanyModel(
      this.title, this.description, this.time, this.price, this.offer);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'time': time,
      'price': price,
      'offer': offer,
    };
  }

  factory ServiceCompanyModel.fromMap(Map<String, dynamic> map) {
    if (map['offer'] == null) {
      map['offer'] = '';
    }
    return ServiceCompanyModel(
      map['title'],
      map['description'],
      map['time'],
      map['price'],
      map['offer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceCompanyModel.fromJson(String source) =>
      ServiceCompanyModel.fromMap(json.decode(source));
}
