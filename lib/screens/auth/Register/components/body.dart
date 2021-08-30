import 'package:flutter/material.dart';
import 'package:shophouse/common/widgets/loading.dart';
import 'package:shophouse/screens/auth/Register/components/registerForm.dart';
import '../../../../common/widgets/buttons/cta_button.dart';
import '../../../../services/authentication.dart';
//import 'loginForm.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shophouse/common/error/AuthException.dart';

class Body extends StatefulWidget {
  final AuthenticationService _auth = AuthenticationService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isAcceptedCGU = false;
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
                Flexible(flex: 3, child: _headerBuilder()),
                Flexible(
                  flex: 5,
                  child: Flex(
                    children: [
                      Expanded(
                        child: RegisterForm(
                            formKey: widget.formKey,
                            nameController: widget.nameController,
                            firstNameController: widget.firstNameController,
                            emailController: widget.emailController,
                            passwordController: widget.passwordController),
                      ),
                      Center(
                        child: _errorMessage(widget.error),
                      )
                    ],
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                Flexible(flex: 3, child: _footerBuilder()),
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
            "Créez un compte",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: const Color(0xff3D5382),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text(
            "Bienvenue ! Créez un compte pour commencer vos courses.",
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
                  var password = widget.passwordController.value.text;
                  var email = widget.emailController.value.text;

                  dynamic result = await widget._auth
                      .registerInWithEmailAndPassword(email, password);
                  if (!(result is User)) {
                    setState(() {
                      widget.loading = false;
                      widget.error =
                          AuthException.generateExceptionMessage(result);
                    });
                  } else {
                    setState(() {
                      widget.loading = true;
                      widget.error = '';
                    });
                  }
                }
              },
              content: Text(
                "Enregistrement",
                style: TextStyle(color: Colors.white, fontSize: 22),
              )),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              child: Text(
                "Vous avez déjà un compte?",
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
