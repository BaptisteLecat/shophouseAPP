import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shophouse/screens/Auth/Login/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:shophouse/screens/auth/EmailVerified/emailVerified_screen.dart';
import 'package:shophouse/screens/auth/Register/register_screen.dart';
//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:shophouse/services/authentication.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:provider/provider.dart';

import 'package:shophouse/screens/home/HomePage.dart';
import 'package:shophouse/screens/Auth/LandingScreen/landing_screen.dart';
import 'package:shophouse/common/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/auth',
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        debugShowCheckedModeBanner: false,
        theme: basicTheme());
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case '/emailVerified':
        return MaterialPageRoute(builder: (context) => EmailVerifiedScreen());
      case '/auth':
        var arguments = settings.arguments;
        if (arguments != null) {
          return MaterialPageRoute(builder: (context) => LandingScreen());
        } else {
          return MaterialPageRoute(builder: (context) => LandingScreen());
        }
      default:
        return pageNotFound();
    }
  }

  static MaterialPageRoute pageNotFound() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
            appBar: AppBar(title: Text("Error"), centerTitle: true),
            body: Center(
              child: Text("Page not found"),
            )));
  }
}
