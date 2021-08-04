import 'package:flutter/material.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Ceci est la HomePage",
              style: TextStyle(fontFamily: 'Poppins'),
            ),
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
    );
  }
}
