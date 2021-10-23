import 'package:firebase_auth/firebase_auth.dart';
import 'package:shophouse/Model/AppUser.dart';
import 'package:shophouse/common/error/AuthException.dart';
import 'package:shophouse/services/Api/repositories/user/UserFetcher.dart';
import 'SharedPreferences.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AppUser?> getCurrentUser() async {
    dynamic user;
    await SharedPreferencesUser()
        .getStayConnected()
        .then((stayConnected) async {
      if (stayConnected != null) {
        if (stayConnected) {
          return await SharedPreferencesUser().getToken().then((token) async {
            if (token != null) {
              print(token);
              await UserFetcher().whoAmI(token: token).then((appUser) {
                user = appUser;
              }).onError((error, stackTrace) {
                return null;
              });
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
        await UserFetcher()
            .whoAmI(id: user.uid, email: user.email)
            .then((appUser) {
          SharedPreferencesUser().setToken(appUser.token);
        });
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

  Future registerInWithEmailAndPassword(
      String email, String password, String name, String firstName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      if (user != null) {
        await user.sendEmailVerification();
        await UserFetcher().register(user.uid, name, firstName, email);
      }

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
