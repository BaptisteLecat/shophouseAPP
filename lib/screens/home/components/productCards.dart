import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';

class ProductCards extends StatefulWidget {
  const ProductCards({Key? key}) : super(key: key);

  @override
  _ProductCardsState createState() => _ProductCardsState();
}

class _ProductCardsState extends State<ProductCards> {
  Widget _generateAddCartInput() {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(color: primaryColor, shape: BoxShape.circle),
      child: Icon(Icons.home),
    );
  }

  Widget _generateProductName() {
    return Container(
      child: Text(
        "Concombre",
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget _generateTimeProduct() {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Text(
        "il y a 2 jours",
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
        onTap: () {},
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
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: Colors.white),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Image.asset("assets/images/test/065-potato.png"),
                ),
              ),
              _generateBottomCard()
            ],
          ),
        ));
  }
}
