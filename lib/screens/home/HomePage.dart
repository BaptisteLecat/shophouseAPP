import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/common/widgets/menu/fab_bottom_app_bar.dart';
import 'package:shophouse/screens/home/components/categories.dart';
import 'package:shophouse/screens/home/components/products.dart';
import 'package:shophouse/services/Api/repositories/category/CategoryFetcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget _generateSearchBar() {
    return Center(
      child: Container(
        constraints: BoxConstraints(minHeight: 50, maxHeight: 60),
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
            color: const Color(0xffF0F4F9),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(width: 1.5, color: const Color(0xffC5CCDA))),
        child: Form(
            key: formKey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    height: 46,
                    child: TextField(
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: const Color(0xff5E709A)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(left: 12, bottom: 11, top: 14),
                          filled: true,
                          fillColor: const Color(0xffF0F4F9),
                          hintText: "Rechercher un produit",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: const Color(0xff5E709A)),
                        )),
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: primaryColor),
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.search)),
                    ))
              ],
            )),
      ),
    );
  }

  Container _generateHeader() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    CategoryFetcher()
        .getCategoryList()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error);
    });
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(top: 60),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: _generateHeader(),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: _generateSearchBar(),
              ),
              Categories(),
              Products()
            ],
          ),
        );
      },
    );
  }
}


/*
Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(flex: 3, child: _generateHeader()),
          Expanded(flex: 2, child: _generateSearchBar()),
          Expanded(flex: 4, child: Categories()),
          Expanded(flex: 5, child: Products())
        ],
      )*/