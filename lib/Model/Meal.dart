// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

import 'package:shophouse/Model/Product.dart';

List<Meal> listMealFromJson(dynamic str) =>
    List<Meal>.from(str.map((x) => Meal.fromJson(x)));

String listMealToJson(List<Meal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Meal mealFromJson(dynamic str) => Meal.fromJson(str);

String mealToJson(Meal data) => json.encode(data.toJson());

class Meal {
  Meal({
    required this.id,
    required this.name,
    required this.description,
    required this.picture,
    required this.products,
  });

  int id;
  String name;
  String description;
  String picture;
  List<Product> products;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        picture: json["picture"],
        products: List<Product>.from(json["product"].map((x) => Product.fromJson(x)))
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "picture": picture,
        "products": listProductToJson(products),
      };
}
