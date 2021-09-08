class AppUser {
  final String uid;
  String name;
  String firstName;
  String email;

  String get id {
    return uid;
  }

  AppUser(
      {required this.uid,
      required this.name,
      required this.firstName,
      required this.email});
}
