class ListMember {
  ListMember({
    required this.id,
    required this.name,
    required this.firstName,
    required this.email,
  });

  String id;
  String name;
  String firstName;
  String email;

  factory ListMember.fromJson(Map<String, dynamic> json) => ListMember(
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
