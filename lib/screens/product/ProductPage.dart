import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/screens/product/components/ProductInfo.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorProduct,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
            ),
          ),
          Expanded(flex: 3, child: ProductInfo())
        ],
      ),
    );
  }
}
