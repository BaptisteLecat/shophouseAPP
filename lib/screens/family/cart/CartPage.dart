import 'package:flutter/material.dart';
import 'package:shophouse/Model/Cart.dart';
import 'package:shophouse/Model/Family.dart';
import 'package:shophouse/Model/Product.dart' as product;
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/screens/cart/cart/components/ListProduct.dart';
import 'package:shophouse/services/Api/repositories/cart/CartFetcher.dart';
import 'package:shophouse/services/Api/repositories/family/FamilyFetcher.dart';

class CartPage extends StatefulWidget {
  final Family family;
  const CartPage({Key? key, required this.family}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool quantityIsUpdated = false;

  void initState() {
    super.initState();
    _loadFamilyCartData();
  }

  void dispose() {
    super.dispose();
  }

  ///This function will be given to the child widget. It will update the value troughout the function.
  _updateProductList(List<product.Product>? listProduct) {
    setState(() {
      if (listProduct != null && widget.family.cart != null) {
        widget.family.cart!.products = listProduct;
      }
      this.quantityIsUpdated = true;
    });
  }

  void _sendQuantityUpdates() {
    if (this.quantityIsUpdated) {
      CartFetcher().updateListProduct(cart: widget.family.cart!).then((carts) {
        setState(() {
          this.quantityIsUpdated = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: successMessageColor,
            content: const Text('La quantité des produits a été modifiée.')));
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: errorMessageColor, content: Text('$error')));
      });
    }
  }

  void _loadFamilyCartData() async {
    await FamilyFetcher()
        .getFamilyCart(familyId: widget.family.id)
        .then((cart) {
      widget.family.cart = cart;
    });
  }

  Widget _generateHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _generateBackButton(context),
          Text(
            widget.family.cart!.title,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          Container()
        ],
      ),
    );
  }

  Widget _generateBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        int count = 0;
        Navigator.of(context).popUntil((_) => count++ >= 1);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Image.asset("assets/icons/ui/left-arrow.png"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: FutureBuilder(
          future: FamilyFetcher().getFamilyCart(familyId: widget.family.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData && snapshot.data != null) {
                wi.cart = snapshot.data as Cart;

                return Column(
                  children: [
                    Expanded(flex: 2, child: _generateHeader(context)),
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Visibility(
                              visible: this.quantityIsUpdated,
                              child: Flex(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                direction: Axis.horizontal,
                                children: [
                                  TextButton(
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  horizontal: 36, vertical: 6)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ))),
                                      onPressed: () {
                                        _sendQuantityUpdates();
                                      },
                                      child: Text("Modifier les quantités",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  color: successMessageColor,
                                                  fontWeight: FontWeight.w600)))
                                ],
                              )),
                        )),
                    Expanded(
                        flex: 7,
                        child: ListProduct(
                          products: this.cart.products,
                          cart: this.cart,
                          listProductCallback: _updateProductList,
                        )),
                  ],
                );
              } else {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
            }
          }),
    );
  }
}
