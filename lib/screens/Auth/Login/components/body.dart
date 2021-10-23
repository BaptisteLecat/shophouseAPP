import 'package:flutter/material.dart';
import 'package:shophouse/common/widgets/ScreenLoader.dart';
import 'package:shophouse/common/widgets/loading.dart';
import 'package:shophouse/screens/RootPage.dart';
import 'package:shophouse/screens/auth/Register/register_screen.dart';
import 'package:shophouse/screens/home/HomePage.dart';
import 'package:shophouse/services/Auth/SharedPreferences.dart';
import '../../../../common/widgets/buttons/cta_button.dart';
import '../../../../services/auth/authentication.dart';
import 'loginForm.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shophouse/common/error/AuthException.dart';

class Body extends StatefulWidget {
  final AuthenticationService _auth = AuthenticationService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool stayConnected = false;
  bool loading = false;
  String error = "";
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ///This function will be given to the child widget. It will update the value troughout the function.
  _updateStayConnectedState(bool stayConnected) {
    setState(() {
      widget.stayConnected = stayConnected;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                  flex: 6,
                  child: Flex(
                    children: [
                      Expanded(
                        child: LoginForm(
                          formKey: widget.formKey,
                          emailController: widget.emailController,
                          passwordController: widget.passwordController,
                          stayConnected: widget.stayConnected,
                          checkBoxCallback: _updateStayConnectedState,
                        ),
                      ),
                      Center(
                        child: _errorMessage(widget.error),
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
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 6),
          Text(
            "Ravi de vous retrouver. Connectez-vous pour reprendre vos courses.",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6,
          )
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
                  var password = widget.passwordController.value.text;
                  var email = widget.emailController.value.text;

                  if (widget.stayConnected) {
                    await SharedPreferencesUser()
                        .setStayConnected(widget.stayConnected);
                  }

                  dynamic result = await widget._auth
                      .signInWithEmailAndPassword(email, password);
                  if (!(result is User)) {
                    setState(() {
                      widget.loading = false;
                      widget.error =
                          AuthException.generateExceptionMessage(result);
                    });
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RootPage(
                                  fromAuth: true,
                                )));
                  }
                }
              },
              content: Text(
                "Connexion",
                style: TextStyle(color: Colors.white, fontSize: 22),
              )),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
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

  Text _errorMessage(String errorMessage) {
    return Text(
      errorMessage,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: errorMessageColor,
          fontSize: 16,
          fontWeight: FontWeight.normal),
    );
  }
}
