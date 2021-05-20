import 'dart:convert';

class RatingModel {
  final String company;
  final String date;
  final String name;
  final String comment;
  final int stars;
  final bool checked;

  RatingModel({
    this.company,
    this.date,
    this.name,
    this.comment,
    this.stars,
    this.checked,
  });

  Map<String, dynamic> toMap() {
    return {
      'company': company,
      'date': date,
      'name': name,
      'comment': comment,
      'stars': stars,
      'checked': checked,
    };
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      company: map['company'],
      date: map['date'],
      name: map['name'],
      comment: map['comment'],
      stars: map['stars'],
      checked: map['checked'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingModel.fromJson(String source) =>
      RatingModel.fromMap(json.decode(source));
}
