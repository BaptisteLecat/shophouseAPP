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
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "Catégories",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    margin: EdgeInsets.only(left: 20, top: 20),
                  )
                ],
              )),
          Flexible(
              flex: 3,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) => Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 20),
                        child: Container(
                          width: 80,
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
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
                                height: 54,
                                width: 54,
                                decoration: BoxDecoration(
                                    color: Color(0xffF0F4F9),
                                    shape: BoxShape.circle),
                                child: Icon(Icons.home),
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
