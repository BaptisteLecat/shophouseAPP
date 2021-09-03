import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Map> categories = [
    {"label": "test", "icon": "icons"},
    {"label": "test", "icon": "icons"},
    {"label": "test", "icon": "icons"},
    {"label": "test", "icon": "icons"},
    {"label": "test", "icon": "icons"},
    {"label": "test", "icon": "icons"}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Row(
            children: [
              Container(
                child: Text(
                  "Catégories",
                  style: Theme.of(context).textTheme.headline3,
                ),
                margin: EdgeInsets.only(left: 20),
              )
            ],
          )),
          Expanded(
              flex: 4,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) => Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 20),
                        child: Container(
                          width: 88,
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(34)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                    color: Color(0xffF0F4F9),
                                    shape: BoxShape.circle),
                                child: Image.asset(
                                  "assets/images/test/030-beef-2.png",
                                ),
                              ),
                              Text(
                                "Légumes",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: secondaryColor),
                              )
                            ],
                          ),
                        ),
                      ))),
        ],
      ),
    );
  }
}
