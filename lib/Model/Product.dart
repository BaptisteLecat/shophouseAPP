// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:shophouse/Model/Category.dart';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.product,
  });

  List<Product> product;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.label,
    required this.description,
    required this.picture,
    required this.category,
  });

  int? id;
  String? label;
  String? description;
  String? picture;
  Category? category;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        label: json["label"],
        description: json["description"],
        picture: json["picture"],
        category: json["category"] != null
            ? Category.fromJson(json["category"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "description": description,
        "picture": picture,
        "category": category!.toJson(),
      };
}
