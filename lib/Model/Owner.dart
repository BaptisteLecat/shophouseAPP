import 'dart:convert';

List<Owner> listOwnerFromJson(dynamic str) =>
    List<Owner>.from(str.map((x) => Owner.fromJson(x)));

String listOwnerToJson(List<Owner> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Owner ownerFromJson(dynamic str) => Owner.fromJson(str);

String ownerToJson(Owner data) => json.encode(data.toJson());

class Owner {
  Owner({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
