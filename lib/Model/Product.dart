// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

import 'package:shophouse/Model/Category.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());


class Product {
  Product({
    required this.id,
    required this.label,
    required this.description,
    required this.picture,
    required this.category,
    required this.quantity,
  });

  int id;
  String label;
  String description;
  String picture;
  Category category;
  int quantity;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        label: json["label"],
        description: json["description"],
        picture: json["picture"],
        category: Category.fromJson(json["category"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "description": description,
        "picture": picture,
        "category": category.toJson(),
        "quantity": quantity,
      };
}
