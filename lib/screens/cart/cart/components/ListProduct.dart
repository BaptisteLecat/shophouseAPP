import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shophouse/Model/Product.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/screens/cart/cart/components/QuantityInput.dart';

class ListProduct extends StatefulWidget {
  List<Product>? products;
  ListProduct({Key? key, required this.products}) : super(key: key);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  Widget _generateContent(Product product) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          product.label!,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildListElement(Product product) {
    return Container(
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child:
                      Image.memory(Base64Decoder().convert(product.picture!)))),
          SizedBox(
            width: 10,
          ),
          Flexible(flex: 5, child: _generateContent(product)),
          Flexible(
              flex: 3,
              child: Container(
                child: QuantityInput(
                  quantity: 3,
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 6,
              offset: Offset(0, -2), // changes position of shadow
            ),
          ],
        ),
        child: ListView.separated(
          padding: const EdgeInsets.only(right: 25, left: 25),
          itemCount: widget.products!.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            Product product = widget.products![index];
            return _buildListElement(product);
          },
        ));
  }
}
