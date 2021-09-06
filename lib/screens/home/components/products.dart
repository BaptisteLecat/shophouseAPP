import 'package:flutter/material.dart';
import 'package:shophouse/screens/home/components/productCards.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            Container(
              child: Text(
                "Produits",
                style: Theme.of(context).textTheme.headline3,
              ),
              margin: EdgeInsets.only(left: 20),
            )
          ],
        ),
        Container(
          child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding:
                  EdgeInsets.only(top: 10, bottom: 30, left: 20, right: 20),
              itemCount: 30,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
                childAspectRatio: 0.80,
              ),
              itemBuilder: (context, index) => ProductCards()),
        )
      ],
    ));
  }
}

/*


        Flexible(
            ),*/
