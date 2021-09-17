import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/screens/cart/cart/components/ListProduct.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  Widget _generateHeader() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(color: Colors.red, height: 20, width: 20),
          Text("Camping"),
          Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Expanded(flex: 2, child: _generateHeader()),
          Expanded(flex: 4, child: ListProduct()),
        ],
      ),
    );
  }
}
