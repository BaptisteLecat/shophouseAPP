import 'package:flutter/material.dart';
import 'inputDecoration/defaultDecoration.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const InputPassword(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: true,
      cursorColor: const Color(0xff3D5382),
      style: TextStyle(
        color: const Color(0x993D5382),
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      decoration: DefaultDecoration.inputDecoration(hintText: widget.hintText),
    );
  }
}
