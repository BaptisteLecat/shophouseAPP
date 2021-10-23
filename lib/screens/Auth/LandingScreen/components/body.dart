import 'package:flutter/material.dart';
import 'package:shophouse/screens/auth/Login/login_screen.dart';
import 'package:shophouse/screens/auth/Register/register_screen.dart';
import 'background.dart';
import '../../../../common/widgets/buttons/cta_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  Widget _buildTitleText(String firstText, String secondText, Color firstColor,
      Color secondColor) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: TextStyle(
              fontFamily: 'LilitaOne', fontSize: 54, color: firstColor),
          children: <TextSpan>[
            TextSpan(
              text: secondText,
              style: TextStyle(color: secondColor),
            )
          ],
        ),
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
          const SizedBox(
            height: 15,
          ),
          Text(
            "Listez et prévoyez vos courses pour ne plus rien oublier",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: const Color(0x993D5382),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Container _buildAuthButtons(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CTAButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            content: Text(
              "Connexion",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: const Color(0xffFFFFFF),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()));
            },
            child: Text(
              "Enregistrement",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: const Color(0xff3D5382),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          )
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
              _buildAuthButtons(context),
            ],
          ),
        ),
      ),
    );
  }
}
