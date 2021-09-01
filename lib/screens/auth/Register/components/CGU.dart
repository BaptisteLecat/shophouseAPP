import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/common/error/AuthException.dart';

class CGU extends StatefulWidget {
  bool isAcceptedCGU;
  ValueChanged<bool> checkBoxCallback;
  ValueChanged<String> errorCodeCallback;
  CGU(
      {Key? key,
      required this.isAcceptedCGU,
      required this.checkBoxCallback,
      required this.errorCodeCallback})
      : super(key: key);

  @override
  _CGUState createState() => _CGUState();
}

class _CGUState extends State<CGU> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormField(
                builder: (state) {
                  return Checkbox(
                      activeColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: inputBorder),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      value: widget.isAcceptedCGU,
                      onChanged: (value) {
                        setState(() {
                          widget.isAcceptedCGU = value!;
                        });
                        widget.checkBoxCallback(widget.isAcceptedCGU);
                      });
                },
                validator: (value) {
                  if (widget.isAcceptedCGU == false) {
                    setState(() {
                      widget.errorCodeCallback("cgu-not-accepted");
                    });
                  }
                },
              ),
            ],
          ),
          Expanded(
              child: RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText1,
                      children: [
                TextSpan(text: "J'accepte les "),
                TextSpan(
                    text: "Conditions d'Utilisations ",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: primaryColor,
                        decoration: TextDecoration.underline)),
                TextSpan(text: "et la "),
                TextSpan(
                    text: "Politique de Confidentialité.",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: primaryColor,
                        decoration: TextDecoration.underline)),
              ]))),
        ],
      ),
    );
  }
}
