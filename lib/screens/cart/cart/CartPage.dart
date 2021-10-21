import 'package:flutter/material.dart';
import 'package:shophouse/Model/Cart.dart';
import 'package:shophouse/Model/Product.dart' as product;
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/screens/cart/cart/components/ListProduct.dart';
import 'package:shophouse/screens/home/components/products.dart';
import 'package:shophouse/services/Api/repositories/cart/CartFetcher.dart';

class CartPage extends StatefulWidget {
  Cart cart;
  bool isCreated;
  CartPage({Key? key, required this.cart, this.isCreated = false})
      : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late product.Products products;
  bool quantityIsUpdated = false;

  void initState() {
    super.initState();
    _loadProductData();
  }

  void dispose() {
    super.dispose();
  }

  ///This function will be given to the child widget. It will update the value troughout the function.
  _updateProductList(List<product.Product>? listProduct) {
    widget.cart.products = listProduct;
    this.quantityIsUpdated = true;
    setState(() {});
  }

  void _sendQuantityUpdates() {
    if (this.quantityIsUpdated) {
      CartFetcher().updateListProduct(cart: widget.cart).then((carts) {
        this.quantityIsUpdated = false;
        widget.cart = carts.cart[0];
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: successMessageColor,
            content: Text('La quantité des produits a été modifiée.')));
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: errorMessageColor, content: Text('$error')));
      });
    }
  }

  void _loadProductData() async {
    print(widget.cart.id!);
    await CartFetcher()
        .getCartProductList(int.parse(widget.cart.id!))
        .then((value) {
      widget.cart.products = value.product;
    });
  }

  Widget _generateHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _generateBackButton(context),
          Text(
            widget.cart.title!,
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
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.all(12),
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
    if (widget.isCreated) {
      Future.delayed(const Duration(seconds: 1), () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: successMessageColor,
            content: Text('Votre panier a été créer avec succès!')));
      });
    }
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
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
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
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
                products: widget.cart.products,
                cart: widget.cart,
                listProductCallback: _updateProductList,
              )),
        ],
      ),
    );
  }
}
