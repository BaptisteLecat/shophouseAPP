// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

import 'package:shophouse/Model/Member.dart';
import 'package:shophouse/Model/Owner.dart';
import 'package:shophouse/Model/Product.dart';

List<Cart> listCartFromJson(dynamic str) =>
    List<Cart>.from(str.map((x) => Cart.fromJson(x)));

String listCartToJson(List<Cart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Cart cartFromJson(dynamic str) => Cart.fromJson(str);

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    required this.id,
    required this.title,
    required this.icon,
    required this.products,
    required this.owner,
    required this.members,
    required this.cartId,
    required this.familyId,
  });

  int id;
  String title;
  String icon;
  List<Product> products;
  Owner? owner;
  List<Member>? members;
  int? cartId;
  int? familyId;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        title: json["title"],
        icon: json["icon"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        owner: (json["owner"] != null) ? Owner.fromJson(json["owner"]) : null,
        members: json["members"] != null
            ? List<Member>.from(json["members"].map((x) => Member.fromJson(x)))
            : null,
        cartId: json["cartId"] != null ? json["cartId"] : null,
        familyId: json["familyId"] != null ? json["familyId"] : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "owner": owner != null ? owner!.toJson() : null,
        "members":
            members != null ? List<Member>.from(members!.map((x) => x)) : null,
        "cartId": cartId != null ? cartId : null,
        "familyId": familyId != null ? familyId : null,
      };
}
