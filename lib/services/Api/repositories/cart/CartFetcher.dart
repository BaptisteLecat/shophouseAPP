import 'package:shophouse/Model/Cart.dart';
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
    final response = await this.post("carts", body: {"cartName": cartName});
    print(response);
    return Product.fromJson(response);
  }

  Future<Carts> addProductInCart(
      {required int cartId,
      required int productId,
      required int quantity}) async {
    final response = await this.post("cart/$cartId/product/$productId",
        body: {"quantity": quantity.toString()});
    return Carts.fromJson(response);
  }

  Future<Carts> updateListProduct({required Cart cart}) async {
    final response = await this.patch("cart/${cart.id}/products",
        body: cart.listProductsToJson(),);
    return Carts.fromJson(response);
  }
}
