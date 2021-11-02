// To parse this JSON data, do
//
//     final family = familyFromJson(jsonString);

import 'package:shophouse/Model/Cart.dart';
import 'dart:convert';

import 'package:shophouse/Model/Owner.dart';
import 'package:shophouse/Model/Product.dart';

Family familyFromJson(String str) => Family.fromJson(json.decode(str));

String familyToJson(Family data) => json.encode(data.toJson());

class Family {
  Family({
    required this.id,
    required this.title,
    required this.icon,
    required this.products,
    required this.owner,
    required this.cartId,
    required this.members,
  });

  int id;
  String title;
  String icon;
  List<Product> products;
  Owner owner;
  int cartId;
  Cart? cart;
  List<dynamic> members;

  factory Family.fromJson(Map<String, dynamic> json) => Family(
        id: json["id"],
        title: json["title"],
        icon: json["icon"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        owner: Owner.fromJson(json["owner"]),
        cartId: json["cartId"],
        members: List<dynamic>.from(json["members"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "owner": owner.toJson(),
        "cartId": cartId,
        "members": List<dynamic>.from(members.map((x) => x)),
      };
}
