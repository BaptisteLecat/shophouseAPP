import 'package:flutter/material.dart';
import 'inputDecoration/defaultDecoration.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  bool hidePassword;
  InputPassword(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.hidePassword})
      : super(key: key);

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: widget.controller,
      obscureText: widget.hidePassword,
      cursorColor: const Color(0xff3D5382),
      validator: (password) {
        if (password != null) {
          if (password.length < 6) {
            return "Minimum 6 caractères.";
          }
        }
      },
      style: TextStyle(
        color: const Color(0x993D5382),
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      decoration: DefaultDecoration.inputDecoration(hintText: widget.hintText),
    );
  }
}
