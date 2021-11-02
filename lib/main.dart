import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shophouse/screens/SplashScreenWrapper.dart';
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
      key: UniqueKey(),
      title: 'Flutter Demo',
      home: SplashScreenWrapper(),
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
    );
  }
}
