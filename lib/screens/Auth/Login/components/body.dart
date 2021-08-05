import 'package:flutter/material.dart';
import '../../../../common/widgets/buttons/cta_button.dart';
import 'loginForm.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Flexible(flex: 2, child: _headerBuilder()),
          Flexible(
            flex: 4,
            child: Flex(
              children: [Expanded(child: LoginForm())],
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          Flexible(flex: 2, child: _footerBuilder()),
          //LoginForm()
        ],
      ),
    );
  }

  Container _headerBuilder() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Vous revoilà !",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: const Color(0xff3D5382),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text(
            "Ravi de vous retrouver. Connecter vous pour reprendre vos courses.",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: const Color(0x993D5382),
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Container _footerBuilder() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CTAButton(
              onPressed: () {},
              content: Text(
                "Connexion",
                style: TextStyle(color: Colors.white, fontSize: 22),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                "Vous n’avez pas encore de compte?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xff3D5382),
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ))
        ],
      ),
    );
  }
}
