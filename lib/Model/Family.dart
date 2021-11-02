// To parse this JSON data, do
//
//     final family = familyFromJson(jsonString);

import 'package:shophouse/Model/Cart.dart';
import 'dart:convert';

import 'package:shophouse/Model/Owner.dart';
import 'package:shophouse/Model/Product.dart';

Family familyFromJson(dynamic str) => Family.fromJson(str);

String familyToJson(Family data) => json.encode(data.toJson());

class Family {
  Family({
    required this.id,
    required this.name,
    required this.icon,
    required this.products,
    required this.owner,
    required this.cartId,
    required this.members,
  });

  int id;
  String name;
  String? icon;
  List<Product>? products;
  Owner owner;
  int? cartId;
  Cart? cart;
  List<dynamic> members;

  factory Family.fromJson(Map<String, dynamic> json) => Family(
        id: json["id"],
        name: json["name"],
        icon: (json["icon"] != null) ? json["icon"] : null,
        products: (json["products"] != null)
            ? List<Product>.from(
                json["products"].map((x) => Product.fromJson(x)))
            : null,
        owner: Owner.fromJson(json["owner"]),
        cartId: (json["cartId"] != null) ? json["cartId"] : null,
        members: List<dynamic>.from(json["members"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "products": (this.products != null)
            ? List<dynamic>.from(products!.map((x) => x.toJson()))
            : null,
        "owner": owner.toJson(),
        "cartId": cartId,
        "members": List<dynamic>.from(members.map((x) => x)),
      };
}
