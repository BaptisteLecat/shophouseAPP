import 'package:flutter/material.dart';
import 'package:shophouse/common/widgets/loading.dart';
import 'package:shophouse/screens/auth/EmailVerified/emailVerified_screen.dart';
import 'package:shophouse/screens/auth/Login/login_screen.dart';
import 'package:shophouse/screens/auth/Register/components/registerForm.dart';
import '../../../../common/widgets/buttons/cta_button.dart';
import '../../../../services/auth/authentication.dart';
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
  ///This function will be given to the child widget. It will update the value troughout the function.
  _updateErrorCodeState(String errorCode) {
    setState(() {
      widget.error = AuthException.generateExceptionMessage(
          AuthException.handleException(
              FirebaseAuthException(code: errorCode)));
    });
  }

  ///This function will be given to the child widget. It will update the value troughout the function.
  _updateCGUState(bool isAcceptedCGU) {
    setState(() {
      widget.isAcceptedCGU = isAcceptedCGU;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.loading
        ? Loading()
        : Container(
            height: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Flexible(flex: 2, child: _headerBuilder()),
                Flexible(
                  flex: 6,
                  child: Flex(
                    children: [
                      Expanded(
                        child: RegisterForm(
                          formKey: widget.formKey,
                          nameController: widget.nameController,
                          firstNameController: widget.firstNameController,
                          emailController: widget.emailController,
                          passwordController: widget.passwordController,
                          isAcceptedCGU: widget.isAcceptedCGU,
                          checkBoxCallback: _updateCGUState,
                          errorCodeCallback: _updateErrorCodeState,
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
                if (widget.formKey.currentState?.validate() == true &&
                    widget.isAcceptedCGU) {
                  setState(() {
                    widget.loading = true;
                  });
                  var password = widget.passwordController.value.text;
                  var email = widget.emailController.value.text;
                  var name = widget.nameController.value.text;
                  var firstname = widget.firstNameController.value.text;

                  dynamic result = await widget._auth
                      .registerInWithEmailAndPassword(
                          email, password, name, firstname);
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
                            builder: (context) => EmailVerifiedScreen()));
                  }
                } else {
                  FocusScope.of(context).requestFocus(new FocusNode());
                }
              },
              content: Text(
                "Enregistrement",
                style: TextStyle(color: Colors.white, fontSize: 22),
              )),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
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
