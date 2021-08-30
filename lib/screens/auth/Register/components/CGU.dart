import 'package:flutter/material.dart';

class CGU extends StatefulWidget {
  bool isAcceptedCGU;
  ValueChanged<bool> callback;
  CGU({Key? key, required this.isAcceptedCGU, required this.callback})
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
              Checkbox(
                  value: widget.isAcceptedCGU,
                  onChanged: (value) {
                    setState(() {
                      widget.isAcceptedCGU = value!;
                    });
                    widget.callback(widget.isAcceptedCGU);
                  })
            ],
          ),
          /*RichText(
              text: TextSpan(style: TextStyle(fontSize: 12), children: [
            TextSpan(text: "J'accepte les "),
            TextSpan(text: "Conditions d'Utilisations "),
            TextSpan(text: "et la "),
            TextSpan(text: "Politique de Confidentialité."),
          ]))*/
        ],
      ),
    );
  }
}
