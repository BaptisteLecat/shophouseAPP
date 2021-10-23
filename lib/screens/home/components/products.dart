import 'package:flutter/material.dart';
import 'package:shophouse/Model/Category.dart';
import 'package:shophouse/Model/Product.dart' as products;
import 'package:shophouse/screens/home/components/productCards.dart';
import 'package:shophouse/services/Api/repositories/product/ProductFetcher.dart';

class Products extends StatefulWidget {
  Category? selectedCategory;
  Products({Key? key, this.selectedCategory}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void dispose() {
    super.dispose();
  }

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
              margin: const EdgeInsets.only(left: 20),
            )
          ],
        ),
        Container(
          child: FutureBuilder(
              future: ProductFetcher().getProductList(
                  categoryId: (widget.selectedCategory != null)
                      ? widget.selectedCategory!.id
                      : null),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData && snapshot.data != null) {
                    products.Products listProducts =
                        snapshot.data as products.Products;
                    if (listProducts.product.length < 1) {
                      return Container(
                        height: 140,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Aucun produit pour cette catégorie.")
                          ],
                        ),
                      );
                    } else {
                      return GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 30, left: 20, right: 20),
                          itemCount: listProducts.product.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.80,
                          ),
                          itemBuilder: (context, index) {
                            return ProductCards(
                                product: listProducts.product[index]);
                          });
                    }
                  } else {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  }
                }
              }),
        )
      ],
    ));
  }
}
