import 'package:firebase_auth/firebase_auth.dart';
import 'package:shophouse/Model/AppUser.dart';
import 'package:shophouse/common/error/AuthException.dart';
import 'SharedPreferences.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AppUser?> getCurrentUser() async {
    dynamic user = null;
    await SharedPreferencesUser()
        .getStayConnected()
        .then((stayConnected) async {
      if (stayConnected != null) {
        if (stayConnected) {
          return await SharedPreferencesUser().getUserId().then((uid) {
            ///Temporary connection
            if (uid == "fi2n5a3QGadpdblSHKF53ALiyuG3") {
              user = AppUser(
                  uid: uid!,
                  name: "Lecat",
                  firstName: "Baptiste",
                  email: "baptiste.lecat44@gmail.com");
              return user;
            } else {
              return null;
            }
          });
        }
      }
    });
    return user;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (!user!.emailVerified) {
        throw new FirebaseAuthException(code: "email-not-verified");
      } else {
        ///Save user ID in shared_preferences
        SharedPreferencesUser().setUserId(user.uid);
        SharedPreferencesUser().getUserId().then((value) => print(value));
      }
      return user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return AuthException.handleException(e);
    }
  }

  bool emailIsVerified() {
    bool isVerified = false;
    if (_auth.currentUser!.emailVerified) {
      isVerified = true;
    }
    return isVerified;
  }

  Future<void> reloadUser() async {
    return _auth.currentUser!.reload();
  }

  String? userEmail() {
    return _auth.currentUser!.email;
  }

  Future registerInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      if (user != null) {
        await user.sendEmailVerification();
      }
      //TODO créer un nouveau user dans firestore

      return user;
    } catch (e) {
      print(e.toString());
      return AuthException.handleException(e);
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }
}
