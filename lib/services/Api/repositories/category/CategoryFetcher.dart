import 'dart:convert';

import 'package:shophouse/Model/Cart.dart';
import 'package:shophouse/services/Api/MainFetcher.dart';
import 'package:shophouse/Model/Category.dart';

class CategoryFetcher extends MainFetcher {
  CategoryFetcher() {
    this.setUserToken();
  }

  Future<List<Category>> getCategoryList() async {
    final response = await this.get("categories");
    print(response);
    return listCategoryFromJson(response);
  }

  Future<Category> getCategory(int id) async {
    final response = await this.get("category/$id");
    print(response);
    return Category.fromJson(response);
  }
}
