import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shophouse/Model/AppUser.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    return Scaffold(
      body: Center(child: Text(user!.uid),),
    );
  }
}
