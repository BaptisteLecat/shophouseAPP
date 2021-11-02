import 'dart:convert';

List<Member> listMemberFromJson(dynamic str) =>
    List<Member>.from(str.map((x) => Member.fromJson(x)));

String listMemberToJson(List<Member> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Member memberFromJson(dynamic str) => Member.fromJson(str);

String memberToJson(Member data) => json.encode(data.toJson());

class Member {
  Member({
    required this.id,
    required this.name,
    required this.firstName,
    required this.email,
  });

  int id;
  String name;
  String firstName;
  String email;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        name: json["name"],
        firstName: json["firstName"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "firstName": firstName,
        "email": email,
      };
}
