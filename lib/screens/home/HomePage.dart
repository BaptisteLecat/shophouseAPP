import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Container _generateSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: const Color(0xffF0F4F9),
          borderRadius: BorderRadius.all(Radius.circular(24)),
          border: Border.all(width: 1.5, color: const Color(0xffC5CCDA))),
      child: Form(
          key: formKey,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  child: TextField(
                      decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF0F4F9),
                    hintText: "hintText",
                    hintStyle: TextStyle(
                      color: const Color(0x993D5382),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
                ),
              ),
              Container(
                height: 38,
                width: 38,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: primaryColor),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              )
            ],
          )),
    );
  }

  Container _generateHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Parcourez",
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.start,
                ),
                Text(
                  "Faites votre liste et sélectionnez les produits dont vous avez besoin.",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [_generateHeader(), _generateSearchBar()],
    ));
  }
}
