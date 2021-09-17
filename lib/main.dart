import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shophouse/Model/AppUser.dart';
import 'package:shophouse/screens/Auth/Login/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:shophouse/screens/SplashScreenWrapper.dart';
import 'package:shophouse/screens/auth/EmailVerified/emailVerified_screen.dart';
import 'package:shophouse/screens/auth/Register/register_screen.dart';
//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:provider/provider.dart';

import 'package:shophouse/screens/home/HomePage.dart';
import 'package:shophouse/screens/Auth/LandingScreen/landing_screen.dart';
import 'package:shophouse/common/theme.dart';
import 'package:shophouse/services/Auth/Authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: UniqueKey(),
      title: 'Flutter Demo',
      home: SplashScreenWrapper(),
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
    );
  }
}
