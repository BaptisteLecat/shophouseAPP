import 'package:flutter/material.dart';

class HidePasswordButton extends StatelessWidget {
  final bool state = false;
  final Color color;
  const HidePasswordButton({
    Key? key,
    this.color = const Color(0xff3D5382),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 60,
        child: TextButton(
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all(this.color.withOpacity(0.1)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    side: BorderSide(
                        color: this.color, width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8.0)))),
            onPressed: () {},
            child: Image.asset("assets/icons/hide.png")));
  }
}
