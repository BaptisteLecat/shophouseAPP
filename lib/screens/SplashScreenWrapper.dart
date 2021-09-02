import 'package:flutter/material.dart';
import 'package:shophouse/model/AppUser.dart';
import 'package:provider/provider.dart';
import 'package:shophouse/screens/auth/LandingScreen/landing_screen.dart';
import 'package:shophouse/screens/home/HomePage.dart';

class SplashScreenWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*if (user == null) {*/
    return LandingScreen();
    /* } else {
      return HomePage();
    }*/
  }
}
