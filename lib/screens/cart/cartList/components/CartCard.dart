import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shophouse/Model/Cart.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/screens/cart/cart/CartPage.dart';

class CartCard extends StatefulWidget {
  Cart cart;
  CartCard({Key? key, required this.cart}) : super(key: key);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(new PageRouteBuilder(
            opaque: true,
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, _, __) {
              return new CartPage(cart: widget.cart);
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
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 90,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image.memory(Base64Decoder().convert(widget.cart.icon!)),
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
                            widget.cart.owner!.name!,
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
                          widget.cart.title!,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            "${widget.cart.products!.length}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: secondaryColorLessOpacity,
                                    fontWeight: FontWeight.w400),
                          )),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
