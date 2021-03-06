import 'package:flutter/material.dart';
import 'package:shophouse/Model/AppUser.dart';
import 'package:shophouse/common/widgets/ScreenLoader.dart';
import 'package:shophouse/screens/RootPage.dart';
import 'package:shophouse/screens/auth/LandingScreen/landing_screen.dart';
import 'package:shophouse/services/Auth/Authentication.dart';

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({Key? key}) : super(key: key);

  @override
  _SplashScreenWrapperState createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    Widget returnedWidget;
    return FutureBuilder(
        future: AuthenticationService().getCurrentUser(),
        builder: (context, AsyncSnapshot<AppUser?> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            print("user uid: ${snapshot.data!.uid}");
            if (snapshot.data!.uid == null) {
              returnedWidget = LandingScreen();
            } else {
              returnedWidget = RootPage(
                fromAuth: true,
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            returnedWidget = Scaffold(
              body: ScreenLoader(),
            );
          } else {
            returnedWidget = LandingScreen();
          }
          return returnedWidget;
        });
  }
}
