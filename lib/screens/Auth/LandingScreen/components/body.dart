import 'package:flutter/material.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  RichText _buildTitleText(String firstText, String secondText,
      Color firstColor, Color secondColor) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style:
            TextStyle(fontFamily: 'LilitaOne', fontSize: 54, color: firstColor),
        children: <TextSpan>[
          TextSpan(
            text: secondText,
            style: TextStyle(color: secondColor),
          )
        ],
      ),
    );
  }

  Container _buildInfoText() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Réalisez vos courses plus facilement",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: const Color(0xff3D5382),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Listez et prévoyez vos courses pour ne plus rien oublier",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: const Color(0x993D5382),
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.1, vertical: size.height * 0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildTitleText(
                  "SHOP", "HOUSE", Color(0xffFDAB53), Color(0xff3D5382)),
              _buildInfoText(),
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
