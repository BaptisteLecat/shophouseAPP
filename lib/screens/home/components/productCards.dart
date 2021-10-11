import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shophouse/Model/Product.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/common/widgets/modal/modalAddToCartForm.dart';
import 'package:shophouse/screens/product/ProductPage.dart';

class ProductCards extends StatefulWidget {
  Product product;
  ProductCards({Key? key, required this.product}) : super(key: key);

  @override
  _ProductCardsState createState() => _ProductCardsState();
}

class _ProductCardsState extends State<ProductCards> {
  Widget _generateAddCartInput() {
    return GestureDetector(
      onTap: () {
        _displayModal(context);
      },
      child: Container(
        height: 46,
        width: 46,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(color: primaryColor, shape: BoxShape.circle),
        child: Image.asset("assets/icons/shopping.png"),
      ),
    );
  }

  void _displayModal(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: ModalAddToCartForm(
              product: widget.product,
            ),
          );
        });
  }

  Widget _generateProductName() {
    return Container(
      child: Text(
        widget.product.label!,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget _generateTimeProduct() {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Text(
        "2 jours",
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget _generateBottomCard() {
    return Expanded(
      child: Container(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: _generateProductName(),
              ),
            ),
            Expanded(
              child: Container(
                  child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: _generateTimeProduct(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: _generateAddCartInput(),
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
                  Navigator.of(context).push(new PageRouteBuilder(
              opaque: true,
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (BuildContext context, _, __) {
                return new ProductPage();
              },
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return new SlideTransition(
                  child: child,
                  position: new Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(animation),
                );
              }));
        },
        child: Container(
          padding: EdgeInsets.only(top: 15, left: 6, right: 6, bottom: 6),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(18)),
              color: Colors.white),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Image.memory(
                      Base64Decoder().convert(widget.product.picture!)),
                ),
              ),
              _generateBottomCard()
            ],
          ),
        ));
  }
}
