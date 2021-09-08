import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUser {
  ///Key for the userId storage.
  final String _kIdUserPrefs = "idUser";

  /// ------------------------------------------------------------
  /// Method that returns the user id
  /// ------------------------------------------------------------
  Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kIdUserPrefs) ?? null;
  }

  /// ----------------------------------------------------------
  /// Method that saves the user id
  /// ----------------------------------------------------------
  Future<bool> setUserId(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kIdUserPrefs, id);
  }
}
