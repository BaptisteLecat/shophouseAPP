// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Category categoriesFromJson(String str) =>
    Category.fromJson(json.decode(str));

String categoriesToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    required this.id,
    required this.label,
    required this.picture,
  });

  int id;
  String label;
  String picture;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        label: json["label"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "picture": picture,
      };
}
