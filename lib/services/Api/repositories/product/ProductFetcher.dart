import 'dart:convert';

import 'package:shophouse/Model/Cart.dart';
import 'package:shophouse/Model/Product.dart';
import 'package:shophouse/services/Api/MainFetcher.dart';

class ProductFetcher extends MainFetcher {
  ProductFetcher() {
    this.setUserToken();
  }

  Future<List<Product>> getProductList({int? categoryId}) async {
    String filter = (categoryId != null) ? "?categoryId=$categoryId" : "";
    final response = await this.get("products$filter");
    print(response);
    return List<Product>.from(
        json.decode(response)["products"].map((x) => Cart.fromJson(x)));
  }

  Future<Product> getProduct(int id) async {
    final response = await this.get("product/$id");
    print(response);
    return Product.fromJson(response);
  }
}
