import 'package:flutter/material.dart';
import 'package:shophouse/Model/Category.dart' as category;
import 'package:shophouse/screens/home/components/categoryCard.dart';
import 'package:shophouse/services/Api/repositories/category/CategoryFetcher.dart';

class Categories extends StatefulWidget {
  final ValueChanged<category.Category> updateCategory;
  const Categories({Key? key, required this.updateCategory}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selectedIndex = 0;
  late Future<List<category.Category>> _categoriesData;
  List<category.Category> listCategory = [];
  bool startInit = true;

  void initState() {
    _categoriesData = CategoryFetcher().getCategoryList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void selectCategory(int index) {
    _selectedIndex = index;
    widget.updateCategory(listCategory[_selectedIndex]);
  }

  bool _isSelected(index) {
    return index == _selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: Text(
                  "Catégories",
                  style: Theme.of(context).textTheme.headline3,
                ),
                margin: const EdgeInsets.only(left: 20),
              )
            ],
          ),
          Flexible(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.22,
                child: FutureBuilder(
                    future: _categoriesData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (snapshot.hasData && snapshot.data != null) {
                          this.listCategory =
                              snapshot.data as List<category.Category>;
                          if (this.startInit) {
                            listCategory.insert(
                                0,
                                category.Category(
                                    id: 0, label: "Tout", picture: "all"));
                            this.startInit = false;
                          }
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: listCategory.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CategoryCard(
                                    key: Key(index.toString()),
                                    itemIndex: index,
                                    categoryObject: this.listCategory[index],
                                    isSelected: this._isSelected(index),
                                    selectedCategoryCallBack:
                                        this.selectCategory);
                              });
                        } else {
                          return Center(
                            child: Text("${snapshot.error}"),
                          );
                        }
                      }
                    })),
          )
        ],
      ),
    );
  }
}
