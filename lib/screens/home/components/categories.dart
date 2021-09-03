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
    {"label": "Légumes", "icon": "068-carrot.png"},
    {"label": "Viandes", "icon": "030-beef-2.png"},
    {"label": "Fruits", "icon": "076-cherry.png"},
    {"label": "Féculents", "icon": "059-bread.png"},
    {"label": "Sauces", "icon": "017-ketchup.png"},
  ];
  int _selectedIndex = 0;

  String _getIcon(int index) {
    return categories[index]["icon"];
  }

  String _getLabel(int index) {
    return categories[index]["label"];
  }

  bool _isSelected(index) {
    return index == _selectedIndex;
  }

  Widget _generateCategoryCard(index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 20),
        child: Container(
          width: 88,
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(34)),
            color: _isSelected(index) ? primaryColor : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 3), // changes position of shadow
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
                    color:
                        _isSelected(index) ? Colors.white : Color(0xffF0F4F9),
                    shape: BoxShape.circle),
                child: Image.asset(
                  "assets/images/test/${_getIcon(index)}",
                ),
              ),
              Text(
                _getLabel(index),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: _isSelected(index) ? Colors.white : secondaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }

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
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return _generateCategoryCard(index);
                }),
          )
        ],
      ),
    );
  }
}
