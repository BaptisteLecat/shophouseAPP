class Owner {
  Owner({
    required this.id,
    required this.name,
  });

  String? id;
  String? name;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
