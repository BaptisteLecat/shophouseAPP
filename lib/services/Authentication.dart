import 'package:firebase_auth/firebase_auth.dart';
import 'package:shophouse/Model/AppUser.dart';
import 'package:shophouse/common/error/AuthException.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(user.uid) : null;
  }

  Stream<AppUser?>? get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Stream<User?> authStream() {
    return _auth.authStateChanges();
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (!user!.emailVerified) {
        throw new FirebaseAuthException(code: "email-not-verified");
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
