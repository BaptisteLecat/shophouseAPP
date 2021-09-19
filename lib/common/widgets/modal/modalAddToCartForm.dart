import 'package:flutter/material.dart';
import 'package:shophouse/common/widgets/buttons/cta_button.dart';
import 'package:shophouse/common/widgets/inputs/InputNumber/InputNumber.dart';

class ModalAddToCartForm extends StatefulWidget {
  const ModalAddToCartForm({Key? key}) : super(key: key);

  @override
  _ModalAddToCartFormState createState() => _ModalAddToCartFormState();
}

class _ModalAddToCartFormState extends State<ModalAddToCartForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cartNameController = TextEditingController();
  int quantity = 3;
  List<String> cartList = [
    'Android',
    'IOS',
    'Flutter',
    'Node',
    'Java',
    'Python',
    'PHP',
  ];

  void _updateQuantityState(int quantity) {
    this.quantity = quantity;
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
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1.5,
          color: const Color(0xffC5CCDA),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
            "Vous revoilà !",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 6),
          Text(
            "Ravi de vous retrouver. Connectez-vous pour reprendre vos courses.",
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
        SizedBox(
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
    String _value = this.cartList[0];
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Text(
              "Panier",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 60,
              child: DropdownButtonFormField<String>(
                decoration: _inputDecorationBuilder(hintText: ""),
                isExpanded: true,
                hint: Text("Aucun panier"),
                value: _value,
                //elevation: 5,
                style: TextStyle(color: Colors.black),

                items:
                    this.cartList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  _value = value!;
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
                            onPressed: () {},
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