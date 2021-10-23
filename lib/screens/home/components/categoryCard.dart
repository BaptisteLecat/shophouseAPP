import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shophouse/Model/Category.dart' as category;
import 'package:shophouse/common/constant/colors.dart';

class CategoryCard extends StatefulWidget {
  final int itemIndex;
  final category.Category categoryObject;
  final bool isSelected;
  final ValueChanged<int> selectedCategoryCallBack;
  const CategoryCard(
      {Key? key,
      required this.itemIndex,
      required this.categoryObject,
      required this.isSelected,
      required this.selectedCategoryCallBack})
      : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  void dispose() {
    super.dispose();
  }

  String _getIcon() {
    return widget.categoryObject.picture!;
  }

  String _getLabel() {
    return widget.categoryObject.label!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.selectedCategoryCallBack(widget.itemIndex);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 20),
        child: Container(
          width: 88,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(34)),
            color: widget.isSelected ? primaryColor : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                    color: widget.isSelected ? Colors.white : Color(0xffF0F4F9),
                    shape: BoxShape.circle),
                child: (widget.itemIndex > 0)
                    ? Image.memory(Base64Decoder().convert(_getIcon()))
                    : Image.asset(
                        "assets/images/illustrations/shopping-cart.png"),
              ),
              Text(
                _getLabel(),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: widget.isSelected ? Colors.white : secondaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
