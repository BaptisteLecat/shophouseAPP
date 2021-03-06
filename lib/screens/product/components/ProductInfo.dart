import 'package:flutter/material.dart';
import 'package:shophouse/Model/Product.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/common/widgets/buttons/cta_button.dart';

class ProductInfo extends StatefulWidget {
  final Product product;
  const ProductInfo({Key? key, required this.product}) : super(key: key);

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
                offset: const Offset(0, -2), // changes position of shadow
              ),
            ],
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(25.0)),
            color: Colors.white),
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              direction: Axis.horizontal,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 6,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.all(Radius.circular(2)))),
              ],
            ),
            Text(
              widget.product.label,
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: const Border(
                      bottom: const BorderSide(color: primaryColor, width: 2),
                    ),
                  ),
                  child: Text("Description",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 16,
                          )),
                ),
                SizedBox(
                  width: 25,
                ),
                Container(
                  child: Text(
                    "D??tails",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 160,
              child: Text(
                widget.product.description,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(height: 1.9),
                maxLines: 6,
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CTAButton(
                    onPressed: () {},
                    content: Text(
                      "Ajouter au panier",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ));
  }
}
