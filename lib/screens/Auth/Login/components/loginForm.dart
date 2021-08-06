import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecorationBuilder({required String hintText}) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xffEEEEEE),
      hintText: hintText,
      hintStyle: TextStyle(
        color: const Color(0x993D5382),
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1.5,
          color: const Color(0xffC5CCDA),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1.5,
          color: const Color(0xff3D5382),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          TextFormField(
            controller: emailController,
            autofocus: true,
            cursorColor: const Color(0xff3D5382),
            style: TextStyle(
              color: const Color(0xff3D5382),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            decoration: _inputDecorationBuilder(hintText: 'Email'),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            style: TextStyle(
              color: const Color(0x993D5382),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            decoration: _inputDecorationBuilder(hintText: 'Mot de Passe'),
          ),
        ],
      ),
    );
  }
}
