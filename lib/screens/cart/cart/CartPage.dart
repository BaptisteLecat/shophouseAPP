import 'package:flutter/material.dart';
import 'package:shophouse/Model/Cart.dart';
import 'package:shophouse/Model/Product.dart' as product;
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/screens/cart/cart/components/ListProduct.dart';
import 'package:shophouse/screens/home/components/products.dart';
import 'package:shophouse/services/Api/repositories/cart/CartFetcher.dart';

class CartPage extends StatefulWidget {
  Cart cart;
  CartPage({Key? key, required this.cart}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late product.Products products;

  void initState() {
    super.initState();
    _loadProductData();
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
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Expanded(flex: 2, child: _generateHeader(context)),
          Expanded(flex: 1, child: Container()),
          Expanded(
              flex: 7,
              child: ListProduct(
                products: widget.cart.products,
              )),
        ],
      ),
    );
  }
}
