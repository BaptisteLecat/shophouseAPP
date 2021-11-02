import 'package:flutter/material.dart';
import 'package:shophouse/Model/Cart.dart';
import 'package:shophouse/Model/Product.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/common/widgets/buttons/cta_button.dart';
import 'package:shophouse/common/widgets/inputs/InputNumber/InputNumber.dart';
import 'package:shophouse/services/Api/repositories/cart/CartFetcher.dart';
import 'package:shophouse/services/Api/repositories/user/UserFetcher.dart';
import 'package:collection/collection.dart';

class ModalAddToCartForm extends StatefulWidget {
  final Product product;
  const ModalAddToCartForm({Key? key, required this.product}) : super(key: key);

  @override
  _ModalAddToCartFormState createState() => _ModalAddToCartFormState();
}

class _ModalAddToCartFormState extends State<ModalAddToCartForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cartNameController = TextEditingController();
  int quantity = 3;
  late Future<List<Cart>> _cartsData;
  int _selectedValue = 0;
  List<Cart>? listCart;

  void initState() {
    _cartsData = UserFetcher().getCarts();
    super.initState();
  }

  void _updateQuantityState(int quantity) {
    this.quantity = quantity;
  }

  Future<List<DropdownMenuItem<int>>> _generateDropDownItem() async {
    List<DropdownMenuItem<int>> listDropDownCart = [];
    await _cartsData.then((listCart) {
      this.listCart = listCart;
      listCart.forEachIndexed((index, cart) {
        DropdownMenuItem<int> item = DropdownMenuItem<int>(
          child: Text(cart.title),
          value: index,
        );
        listDropDownCart.add(item);
      });
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: errorMessageColor, content: Text('$error')));
    });
    return listDropDownCart;
  }

  InputDecoration _inputDecorationBuilder({required String hintText}) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xffEEEEEE),
      hintText: hintText,
      hintStyle: TextStyle(
        color: const Color(0x993D5382),
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1.5,
          color: const Color(0xffC5CCDA),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1.5,
          color: const Color(0xff3D5382),
        ),
      ),
    );
  }

  Container _headerBuilder() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Ajouter un article",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 6),
          Text(
            "Indiquez la quantité et le panier dans lequel vous souhaitez ajouter l’article.",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }

  Container _generateInputNumber() {
    return Container(
        child: Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.vertical,
      children: [
        Text(
          "Quantité",
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          child: InputNumber(
            value: this.quantity,
            callback: _updateQuantityState,
          ),
        )
      ],
    ));
  }

  Container _generateDropDown() {
    print(_generateDropDownItem());
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Text(
              "Panier",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 60,
              child: FutureBuilder(
                future: _generateDropDownItem(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return DropdownButtonFormField<int>(
                      decoration: _inputDecorationBuilder(hintText: ""),
                      isExpanded: true,
                      hint: const Text("Aucun panier"),
                      value: _selectedValue,
                      //elevation: 5,
                      style: TextStyle(color: Colors.black),

                      items: snapshot.data as List<DropdownMenuItem<int>>,
                      onChanged: (value) {
                        _selectedValue = value!;
                      },
                    );
                  } else {
                    return DropdownButtonFormField<int>(
                      decoration: _inputDecorationBuilder(hintText: ""),
                      isExpanded: true,
                      hint: const Text("Aucun panier"),
                      value: _selectedValue,
                      //elevation: 5,
                      style: TextStyle(color: Colors.black),

                      items: [],
                      onChanged: (value) {
                        _selectedValue = value!;
                      },
                    );
                  }
                },
              ),
            )
          ],
        ));
  }

  Form _generateForm() {
    return Form(
      key: this.formKey,
      child: Column(
        children: [
          _generateDropDown(),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(flex: 2, child: _generateInputNumber()),
                  Flexible(
                      flex: 3,
                      child: Container(
                        height: 50,
                        child: CTAButton(
                            onPressed: () async {
                              if (this.formKey.currentState!.validate()) {
                                if (this.listCart != null) {
                                  await CartFetcher()
                                      .addProductInCart(
                                          cartId: this
                                              .listCart!
                                              [this._selectedValue]
                                              .id,
                                          productId: widget.product.id,
                                          quantity: quantity)
                                      .then((value) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                                successMessageColor,
                                            content: const Text(
                                                'Le produit a été ajouté au panier!')));
                                  }).onError((error, stackTrace) {
                                    print(stackTrace);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: errorMessageColor,
                                            content: Text('$error')));
                                  });
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: errorMessageColor,
                                        content: const Text(
                                            'Aucun panier identifié.')));
                              }
                            },
                            content: Text(
                              "Valider",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            )),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[_headerBuilder(), _generateForm()],
    );
  }
}
