import 'package:flutter/material.dart';
import 'package:shophouse/Model/Product.dart';
import 'package:shophouse/common/constant/colors.dart';

class QuantityInput extends StatefulWidget {
  ValueChanged<Product> quantityCallback;
  Product product;
  int maxValue;
  int minValue;
  QuantityInput(
      {Key? key,
      required this.product,
      required this.quantityCallback,
      this.maxValue = 100,
      this.minValue = 0})
      : super(key: key);

  @override
  _QuantityInputState createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  void _decrement() {
    int quantity = widget.product.quantity;
    if (quantity - 1 >= widget.minValue) {
      widget.product.quantity = quantity - 1;
      widget.quantityCallback(widget.product);
      setState(() {});
    }
  }

  void _increment() {
    int quantity = widget.product.quantity;
    if (quantity + 1 >= widget.minValue) {
      widget.product.quantity = quantity + 1;
      widget.quantityCallback(widget.product);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                _decrement();
              },
              child: Container(
                color: primaryColorLessOpacity,
                padding: EdgeInsets.all(2),
                child: Image.asset("assets/icons/ui/minus.png"),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                "${widget.product.quantity}",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                _increment();
              },
              child: Container(
                color: primaryColorLessOpacity,
                padding: EdgeInsets.all(2),
                child: Image.asset("assets/icons/ui/plus.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
