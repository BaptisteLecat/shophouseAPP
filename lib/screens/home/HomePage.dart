import 'package:flutter/material.dart';
import '../Auth/LandingPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Background(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Ceci est la HomePage"),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/test',
                      arguments: "Voila un contenu envoyer par la HomePage.");
                },
                child: const Text('Enabled'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
