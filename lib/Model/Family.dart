// To parse this JSON data, do
//
//     final family = familyFromJson(jsonString);

import 'package:shophouse/Model/ListMember.dart';
import 'dart:convert';

import 'package:shophouse/Model/Owner.dart';

Family familyFromJson(String str) => Family.fromJson(json.decode(str));

String familyToJson(Family data) => json.encode(data.toJson());

class Family {
  Family({
    required this.family,
  });

  FamilyClass family;

  factory Family.fromJson(Map<String, dynamic> json) => Family(
        family: FamilyClass.fromJson(json["family"]),
      );

  Map<String, dynamic> toJson() => {
        "family": family.toJson(),
      };
}

class FamilyClass {
  FamilyClass({
    required this.id,
    required this.name,
    required this.owner,
    required this.cartId,
    required this.listMembers,
  });

  String id;
  String name;
  Owner owner;
  String cartId;
  List<ListMember> listMembers;

  factory FamilyClass.fromJson(Map<String, dynamic> json) => FamilyClass(
        id: json["id"],
        name: json["name"],
        owner: Owner.fromJson(json["owner"]),
        cartId: json["cartId"],
        listMembers: List<ListMember>.from(
            json["list_members"].map((x) => ListMember.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "owner": owner.toJson(),
        "cartId": cartId,
        "list_members": List<dynamic>.from(listMembers.map((x) => x.toJson())),
      };
}
