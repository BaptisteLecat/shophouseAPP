// To parse this JSON data, do
//
//     final appUser = appUserFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AppUser appUserFromJson(String str) => AppUser.fromJson(json.decode(str));

String appUserToJson(AppUser data) => json.encode(data.toJson());

class AppUser {
  AppUser({
    required this.id,
    required this.name,
    required this.firstName,
    required this.email,
    required this.token,
  });

  String id;
  String name;
  String firstName;
  String email;
  String token;

  String get uid {
    return id;
  }

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        id: json["id"],
        name: json["name"],
        firstName: json["firstName"],
        email: json["email"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "firstName": firstName,
        "email": email,
        "token": token,
      };
}
