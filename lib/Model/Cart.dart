// To parse this JSON data, do
//
//     final carts = cartsFromJson(jsonString);

import 'dart:convert';

import 'package:shophouse/Model/Owner.dart';
import 'package:shophouse/Model/Product.dart';

Carts cartsFromJson(String str) => Carts.fromJson(json.decode(str));

String cartsToJson(Carts data) => json.encode(data.toJson());

class Carts {
  Carts({
    required this.cart,
  });

  List<Cart> cart;

  factory Carts.fromJson(Map<String, dynamic> json) => Carts(
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
      };
}

class Cart {
  Cart({
    required this.id,
    required this.title,
    required this.icon,
    required this.listMembers,
    required this.products,
    required this.familyId,
    required this.owner,
  });

  String? id;
  String? title;
  String? icon;
  List<dynamic>? listMembers;
  List<Product>? products;
  String? familyId;
  Owner? owner;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        title: json["title"],
        icon: json["icon"],
        listMembers: List<dynamic>.from(json["list_members"].map((x) => x)),
        products: List<Product>.from(
            json["list_products"].map((x) => Product.fromJson(x))),
        familyId: json["family_id"] == null ? null : json["family_id"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
        "list_members": List<dynamic>.from(listMembers!.map((x) => x)),
        "list_products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "family_id": familyId == null ? null : familyId,
        "owner": owner == null ? null : owner!.toJson(),
      };

  Map<String, dynamic> listProductsToJson() => {
        "list_products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}
