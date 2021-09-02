import 'package:flutter/material.dart';
import 'package:shophouse/model/AppUser.dart';
import 'package:provider/provider.dart';
import 'package:shophouse/screens/Auth/LandingScreen/landing_screen.dart';
import 'package:shophouse/screens/home/HomePage.dart';

class SplashScreenWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      Navigator.pushNamedAndRemoveUntil(context, "/auth", (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false) ;
    }
    return Container();
  }
}
