import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/screens/cart/cart/components/QuantityInput.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ListView(
        padding: const EdgeInsets.only(top: 30, right: 25, left: 25),
        children: <Widget>[
          Container(
            height: 110,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child:
                        /*Image.memory(
                        Base64Decoder().convert(widget.cart.icon!))*/
                        Container(
                      color: Colors.green,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 5,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              "Vous",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w400),
                            )),
                        FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            "Tomate",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                    flex: 3,
                    child: Container(
                      child: QuantityInput(),
                    ))
              ],
            ),
          ),
          Container(
            height: 50,
            color: Colors.red[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            height: 50,
            color: Colors.red[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }
}
