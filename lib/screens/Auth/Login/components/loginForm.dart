import 'package:flutter/material.dart';
import 'package:shophouse/common/widgets/buttons/hidePassword_button.dart';
import 'package:shophouse/common/widgets/inputs/input_password.dart';
import 'package:shophouse/screens/auth/Login/components/passwordHandler.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginForm(
      {Key? key,
      required this.formKey,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  void dispose() {
    widget.emailController.dispose();
    widget.passwordController.dispose();
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
      key: widget.formKey,
      child: ListView(
        children: [
          Container(
            height: 60,
            child: TextFormField(
              controller: widget.emailController,
              autofocus: true,
              cursorColor: const Color(0xff3D5382),
              style: TextStyle(
                color: const Color(0xff3D5382),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              decoration: _inputDecorationBuilder(hintText: 'Email'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          PasswordHandler(passwordController: widget.passwordController)
        ],
      ),
    );
  }
}
