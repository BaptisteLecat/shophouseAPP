import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/common/widgets/buttons/cta_button.dart';
import 'package:shophouse/screens/cart/cart/CartPage.dart';
import 'package:shophouse/services/Api/repositories/cart/CartFetcher.dart';

class ModalCreateCartForm extends StatefulWidget {
  const ModalCreateCartForm({Key? key}) : super(key: key);

  @override
  _ModalCreateCartFormState createState() => _ModalCreateCartFormState();
}

class _ModalCreateCartFormState extends State<ModalCreateCartForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cartNameController = TextEditingController();

  @override
  dispose() {
    super.dispose();
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
            "Créer un panier",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 6),
          Text(
            "Commencez vos courses maintenant en créant un panier.",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }

  Form _generateForm() {
    return Form(
      key: this.formKey,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 60,
            child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: this.cartNameController,
              autofocus: true,
              cursorColor: const Color(0xff3D5382),
              style: TextStyle(
                color: const Color(0xff3D5382),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              decoration: _inputDecorationBuilder(hintText: 'Nom du panier'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: CTAButton(
                onPressed: () async {
                  if (this.formKey.currentState!.validate()) {
                    await CartFetcher()
                        .createCart(this.cartNameController.text)
                        .then((cartList) async {
                      Navigator.pop(context);
                      await Navigator.of(context).push(new PageRouteBuilder(
                          opaque: true,
                          transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder: (BuildContext context, _, __) {
                            return new CartPage(
                              cart: cartList.cart[0],
                              isCreated: true,
                            );
                          },
                          transitionsBuilder: (_, Animation<double> animation,
                              __, Widget child) {
                            return new SlideTransition(
                              child: child,
                              position: new Tween<Offset>(
                                begin: const Offset(2, 0),
                                end: Offset.zero,
                              ).animate(animation),
                            );
                          }));
                    }).onError((error, stackTrace) {
                      print(error);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: errorMessageColor,
                          content: Text('$error')));
                    });
                  }
                },
                content: Text(
                  "Valider",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                )),
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
