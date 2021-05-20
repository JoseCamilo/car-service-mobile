import 'dart:convert';

class CompanyModel {
  final String id;
  final String title;
  final List<String> assetImage;
  final String description;
  final String sale;
  final RatingCompanyModel rating;
  final List<String> subscription;
  final List<String> tags;
  final List<ServiceCompanyModel> services;
  final List<ServiceCompanyModel> servicesRecommended;
  final String indexing;
  final String address;
  final List<PhoneCompanyModel> phones;
  final String descriptionContact;
  final GeolocationCompanyModel geolocation;

  CompanyModel(
    this.id,
    this.title,
    this.assetImage,
    this.description,
    this.sale,
    this.rating,
    this.subscription,
    this.tags,
    this.services,
    this.servicesRecommended,
    this.indexing,
    this.address,
    this.phones,
    this.descriptionContact,
    this.geolocation,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'assetImage': assetImage,
      'description': description,
      'sale': sale,
      'rating': rating,
      'subscription': subscription,
      'tags': tags,
      'services': services,
      'servicesRecommended': servicesRecommended,
      'indexing': indexing,
      'address': address,
      'phones': phones,
      'descriptionContact': descriptionContact,
      'geolocation': geolocation,
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
    if (map['phones'] == null) {
      map['phones'] = [];
    }
    if (map['descriptionContact'] == null) {
      map['descriptionContact'] = '';
    }
    return CompanyModel(
      map['id'],
      map['title'],
      List<String>.from(map['assetImage']),
      map['description'],
      map['sale'],
      map['rating'] != null ? RatingCompanyModel.fromMap(map['rating']) : null,
      List<String>.from(map['subscription']),
      List<String>.from(map['tags']),
      List<ServiceCompanyModel>.from(
        map['services'].map((x) => ServiceCompanyModel.fromMap(x)),
      ),
      List<ServiceCompanyModel>.from(
        map['servicesRecommended'].map((x) => ServiceCompanyModel.fromMap(x)),
      ),
      map['indexing'],
      map['address'],
      List<PhoneCompanyModel>.from(
        map['phones'].map((x) => PhoneCompanyModel.fromMap(x)),
      ),
      map['descriptionContact'],
      map['geolocation'] != null
          ? GeolocationCompanyModel.fromMap(map['geolocation'])
          : null,
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

class PhoneCompanyModel {
  final String type;
  final String number;

  PhoneCompanyModel(this.type, this.number);

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'number': number,
    };
  }

  factory PhoneCompanyModel.fromMap(Map<String, dynamic> map) {
    return PhoneCompanyModel(
      map['type'],
      map['number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PhoneCompanyModel.fromJson(String source) =>
      PhoneCompanyModel.fromMap(json.decode(source));
}

class GeolocationCompanyModel {
  final double latitude;
  final double longitude;

  GeolocationCompanyModel(this.latitude, this.longitude);

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory GeolocationCompanyModel.fromMap(Map<String, dynamic> map) {
    return GeolocationCompanyModel(
      map['latitude'],
      map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GeolocationCompanyModel.fromJson(String source) =>
      GeolocationCompanyModel.fromMap(json.decode(source));
}

class RatingCompanyModel {
  final double stars;
  final int ratings;
  final int oneStars;
  final int twoStars;
  final int threeStars;
  final int fourStars;
  final int fiveStars;

  RatingCompanyModel(this.stars, this.ratings, this.oneStars, this.twoStars,
      this.threeStars, this.fourStars, this.fiveStars);

  Map<String, dynamic> toMap() {
    return {
      'stars': stars,
      'ratings': ratings,
      'oneStars': oneStars,
      'twoStars': twoStars,
      'threeStars': threeStars,
      'fourStars': fourStars,
      'fiveStars': fiveStars,
    };
  }

  factory RatingCompanyModel.fromMap(Map<String, dynamic> map) {
    return RatingCompanyModel(
      map['stars'],
      map['ratings'],
      map['oneStars'],
      map['twoStars'],
      map['threeStars'],
      map['fourStars'],
      map['fiveStars'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingCompanyModel.fromJson(String source) =>
      RatingCompanyModel.fromMap(json.decode(source));
}
