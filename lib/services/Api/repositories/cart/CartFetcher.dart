import 'package:shophouse/Model/Product.dart';
import 'package:shophouse/services/Api/MainFetcher.dart';
import 'package:shophouse/Model/Category.dart';

class CartFetcher extends MainFetcher {
  Future<Products> getCartProductList(int id) async {
    final response = await this.get("cart/$id/products");
    print(response);
    return Products.fromJson(response);
  }

  Future<Product> createCart(String cartName) async {
    final response = await this.post("carts", body: {"cartName" : cartName});
    print(response);
    return Product.fromJson(response);
  }
}
