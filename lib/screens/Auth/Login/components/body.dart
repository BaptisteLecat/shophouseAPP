import 'package:flutter/material.dart';
import 'package:shophouse/common/widgets/loading.dart';
import '../../../../common/widgets/buttons/cta_button.dart';
import '../../../../services/authentication.dart';
import 'loginForm.dart';

class Body extends StatefulWidget {
  final AuthenticationService _auth = AuthenticationService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;
  String error = "";
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return widget.loading
        ? Loading()
        : Container(
            height: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Flexible(flex: 2, child: _headerBuilder()),
                Flexible(
                  flex: 4,
                  child: Flex(
                    children: [
                      Expanded(
                        child: LoginForm(
                            formKey: widget.formKey,
                            emailController: widget.emailController,
                            passwordController: widget.passwordController),
                      )
                    ],
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                Flexible(flex: 2, child: _footerBuilder()),
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
            "Ravi de vous retrouver. Connectez-vous pour reprendre vos courses.",
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
              onPressed: () async {
                if (widget.formKey.currentState?.validate() == true) {
                  //setState(() => this.loading = true);
                  var password = widget.passwordController.value.text;
                  var email = widget.emailController.value.text;

                  dynamic result = await widget._auth
                      .signInWithEmailAndPassword(email, password);
                  if (result == null) {
                    setState(() {
                      widget.loading = false;
                      widget.error = 'Merci de renseigner une email valide.';
                    });
                  }
                }
              },
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
