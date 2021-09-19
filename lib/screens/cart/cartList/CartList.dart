import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shophouse/Model/Cart.dart' as carts;
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/common/widgets/modal/modalAddToCartForm.dart';
import 'package:shophouse/common/widgets/modal/modalCreateCartForm.dart';
import 'package:shophouse/screens/cart/cartList/components/CartCard.dart';
import 'package:shophouse/services/Api/repositories/user/UserFetcher.dart';
import 'package:nice_buttons/nice_buttons.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  late Future<carts.Carts> _cartsData;

  void initState() {
    _cartsData = UserFetcher().getCarts();
    super.initState();
  }

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
            "Retrouvez vos paniers et partagez les avec vos amis.",
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }

  void _displayModal(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: ModalAddToCartForm(), //ModalCreateCartForm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          padding: EdgeInsets.only(top: 60, left: 25, right: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _generateHeader(),
                        SizedBox(height: 10),
                        NiceButtons(
                          height: 110,
                          startColor: primaryColorDarker1,
                          endColor: primaryColor,
                          borderColor: primaryColorDarker2,
                          borderRadius: 12,
                          borderThickness: 7,
                          stretch: true,
                          gradientOrientation: GradientOrientation.Horizontal,
                          onTap: (value) {
                            _displayModal(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Flex(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Image.asset(
                                        "assets/images/illustrations/031-groceries.png")),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Créer un panier",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                          Text(
                                            "Appuyez-ici pour ajouter un nouveau panier.",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    color: Colors.white
                                                        .withOpacity(0.7),
                                                    fontWeight:
                                                        FontWeight.w100),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 4,
                child: FutureBuilder(
                    future: _cartsData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (snapshot.hasData && snapshot.data != null) {
                          carts.Carts listCarts = snapshot.data as carts.Carts;
                          return ListView.builder(
                            padding: EdgeInsets.only(top: 0),
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
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
