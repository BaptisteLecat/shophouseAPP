import 'package:flutter/material.dart';
import 'package:shophouse/Model/Cart.dart' as carts;
import 'package:shophouse/screens/cart/components/CartCard.dart';
import 'package:shophouse/services/Api/repositories/user/UserFetcher.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Container _generateHeader() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Paniers",
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.start,
          ),
          Text(
            "Retrouvez les paniers que vous partagez avec vos amis.",
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(top: 60, left: 25, right: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _generateHeader(),
              FutureBuilder(
                  future: UserFetcher().getCarts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasData && snapshot.data != null) {
                        carts.Carts listCarts = snapshot.data as carts.Carts;
                        return ListView.builder(
                          padding: EdgeInsets.only(top: 25),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: listCarts.cart.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CartCard(cart: listCarts.cart[index]);
                          },
                        );
                      } else {
                        return Center(
                          child: Text("${snapshot.error}"),
                        );
                      }
                    }
                  })
            ],
          ),
        );
      },
    );
  }
}
