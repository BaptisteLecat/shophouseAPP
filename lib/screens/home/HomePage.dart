import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shophouse/Model/Category.dart' as category;
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/common/widgets/ScreenLoader.dart';
import 'package:shophouse/common/widgets/layout/header.dart';
import 'package:shophouse/screens/home/components/categories.dart';
import 'package:shophouse/screens/home/components/products.dart';

class HomePage extends StatefulWidget {
  bool fromAuth;
  HomePage({Key? key, this.fromAuth = false}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: '_homeScreenkey');
  category.Category? selectedCategory;
  bool showLoader = false;
  late Timer timer;

  startTimer() {
    setState(() {
      showLoader = true;
    });
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (timer.tick == 1) {
        cancelTimer();
        setState(() {
          showLoader = false;
        });
      }
    });
  }

  cancelTimer() {
    timer.cancel();
  }

  @override
  void initState() {
    super.initState();
    print(widget.fromAuth);
    if (widget.fromAuth) {
      startTimer();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateSelectedCategory(category.Category category) {
    setState(() {
      this.selectedCategory = category;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return (this.showLoader)
        ? ScreenLoader()
        : LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.loose,
                      child: const Header(
                          title: "Parcourez",
                          content:
                              "Faites votre liste et sélectionnez les produits dont vous avez besoin."),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: _generateSearchBar(),
                    ),
                    Categories(
                      updateCategory: _updateSelectedCategory,
                    ),
                    Products(
                      selectedCategory: this.selectedCategory,
                    )
                  ],
                ),
              );
            },
          );
  }
}
