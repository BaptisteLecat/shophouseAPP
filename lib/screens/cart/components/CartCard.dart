import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';

class CartCard extends StatefulWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Image.asset('assets/images/cart/036-shopping cart.png'),
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
                        "Camping",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          "33 articles",
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
    );
  }
}
