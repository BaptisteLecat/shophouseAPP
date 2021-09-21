import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shophouse/Model/Cart.dart';
import 'package:shophouse/Model/Product.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/screens/cart/cart/components/QuantityInput.dart';

class ListProduct extends StatefulWidget {
  ValueChanged<List<Product>?> listProductCallback;
  List<Product>? products;
  Cart cart;
  ListProduct(
      {Key? key,
      required this.products,
      required this.cart,
      required this.listProductCallback})
      : super(key: key);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  ///This function will be given to the child widget. It will update the value troughout the function.
  _updateProductQuantity(Product product) {
    widget.products![_findIndexOfProduct(product)].quantity = product.quantity;
    widget.listProductCallback(widget.products!);
  }

  int _findIndexOfProduct(Product queryProduct) {
    return widget.products!.indexOf(queryProduct);
  }

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
                  product: product,
                  quantityCallback: _updateProductQuantity,
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
