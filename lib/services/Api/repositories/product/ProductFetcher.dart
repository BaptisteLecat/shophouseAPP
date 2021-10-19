import 'package:http/http.dart' as http;
import 'package:shophouse/Model/Product.dart';
import 'package:shophouse/services/Api/MainFetcher.dart';

class ProductFetcher extends MainFetcher {
  ProductFetcher() {
    this.setUserToken();
  }

  Future<Products> getProductList({int? categoryId}) async {
    String filter = (categoryId != null) ? "?categoryId=$categoryId" : "";
    final response = await this.get("products$filter");
    print(response);
    return Products.fromJson(response);
  }

  Future<Product> getProduct(int id) async {
    final response = await this.get("product/$id");
    print(response);
    return Product.fromJson(response);
  }
}
