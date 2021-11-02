// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

List<Category> listCategoryFromJson(dynamic str) =>
    List<Category>.from(str.map((x) => Category.fromJson(x)));

String listCategoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Category categoryFromJson(dynamic str) => Category.fromJson(str);

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    required this.id,
    required this.label,
    required this.picture,
  });

  int? id;
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
