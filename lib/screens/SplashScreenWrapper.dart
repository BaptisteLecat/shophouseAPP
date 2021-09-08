import 'package:flutter/material.dart';
import 'package:shophouse/Model/AppUser.dart';
import 'package:shophouse/screens/auth/LandingScreen/landing_screen.dart';
import 'package:shophouse/screens/home/HomePage.dart';
import 'package:shophouse/services/Auth/Authentication.dart';

class SplashScreenWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppUser? user = AuthenticationService().getCurrentUser();
    if (user == null) {
      return LandingScreen();
    } else {
      return HomePage();
    }
  }
}
