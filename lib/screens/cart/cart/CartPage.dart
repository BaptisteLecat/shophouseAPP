import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/screens/cart/cart/components/ListProduct.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  Widget _generateHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _generateBackButton(context),
          Text(
            "Camping",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          Container()
        ],
      ),
    );
  }

  Widget _generateBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Image.asset("assets/icons/ui/left-arrow.png"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Expanded(flex: 2, child: _generateHeader(context)),
          Expanded(flex: 1, child: Container()),
          Expanded(flex: 7, child: ListProduct()),
        ],
      ),
    );
  }
}
