import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/common/widgets/buttons/cta_button.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 0,
                blurRadius: 6,
                offset: Offset(0, -2), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            color: Colors.white),
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              direction: Axis.horizontal,
              children: [
                Container(
                    height: 6,
                    width: 60,
                    decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.all(Radius.circular(2)))),
              ],
            ),
            Text(
              "Salade",
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              children: [
                Container(
                  child: Text("Description"),
                ),
                Container(
                  child: Text("Détails"),
                ),
              ],
            ),
            Text(
                "Une grande richesse en fibres: indispensable pour assurer un bon transit, détoxifier l’organisme, bien nourrir le microbiote (et empêcher la prolifération des bactéries pathogènes), ralentir la charge glycémique et amener rapidement à satiété.",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      height: 1.9,
                    )),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CTAButton(onPressed: () {}, content: Text("Ajouter au panier"))
              ],
            )
          ],
        ));
  }
}
