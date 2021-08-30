import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/screens/auth/Login/components/passwordHandler.dart';

class RegisterForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  TextEditingController nameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RegisterForm(
      {Key? key,
      required this.formKey,
      required this.nameController,
      required this.firstNameController,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  void dispose() {
    widget.emailController.dispose();
    widget.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: ListView(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: widget.nameController,
                    autofocus: true,
                    cursorColor: const Color(0xff3D5382),
                    style: TextStyle(
                      color: const Color(0xff3D5382),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: _inputDecorationBuilder(hintText: 'Nom'),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  height: 60,
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: widget.firstNameController,
                    autofocus: true,
                    cursorColor: const Color(0xff3D5382),
                    style: TextStyle(
                      color: const Color(0xff3D5382),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: _inputDecorationBuilder(hintText: 'Prénom'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          /** Section for the Email */
          Container(
            height: 60,
            child: TextFormField(
              textInputAction: TextInputAction.next,
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
          /** End Section Email */

          SizedBox(
            height: 10,
          ),
          PasswordHandler(passwordController: widget.passwordController),
          SizedBox(
            height: 10,
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Mot de passe oublié",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: secondaryColor),
                ),
              )
            ],
          )
        ],
      ),
    );
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
}
