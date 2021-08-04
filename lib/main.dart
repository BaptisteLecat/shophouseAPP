import 'package:flutter/material.dart';

import 'package:shophouse/screens/home/HomePage.dart';
import 'package:shophouse/screens/Auth/LandingScreen/landing_screen.dart';

void main() {
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
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: Colors.red,
        ));
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
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
