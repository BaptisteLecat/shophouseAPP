import 'package:flutter/material.dart';
import 'package:shophouse/screens/SplashScreenWrapper.dart';
import 'package:shophouse/services/Authentication.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HomePage"),
            TextButton(
                onPressed: () async {
                  await AuthenticationService().signOut().then((value) =>
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashScreenWrapper())));
                },
                child: Text("Disconnect"))
          ],
        ),
      ),
    );
  }
}
