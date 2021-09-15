// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Categories categoriesFromJson(String str) =>
    Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  Categories({
    required this.category,
  });

  List<Category> category;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

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
