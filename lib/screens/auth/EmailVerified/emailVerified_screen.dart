import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shophouse/screens/RootPage.dart';
import 'package:shophouse/screens/home/HomePage.dart';
import 'package:shophouse/services/Auth/Authentication.dart';

class EmailVerifiedScreen extends StatefulWidget {
  @override
  _EmailVerifiedScreenState createState() => _EmailVerifiedScreenState();
}

class _EmailVerifiedScreenState extends State<EmailVerifiedScreen> {
  final auth = AuthenticationService();
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Text('An email has been sent to ${auth.userEmail()} please verify'),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    await auth.reloadUser();
    if (auth.emailIsVerified()) {
      timer.cancel();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => RootPage()));
    }
  }
}
