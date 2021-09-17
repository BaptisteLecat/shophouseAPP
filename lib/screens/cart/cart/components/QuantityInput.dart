import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';

class QuantityInput extends StatefulWidget {
  const QuantityInput({Key? key}) : super(key: key);

  @override
  _QuantityInputState createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: primaryColorLessOpacity,
              padding: EdgeInsets.all(2),
              child: Image.asset("assets/icons/ui/minus.png"),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                "2",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: primaryColorLessOpacity,
              padding: EdgeInsets.all(2),
              child: Image.asset("assets/icons/ui/plus.png"),
            ),
          ),
        ],
      ),
    );
  }
}
