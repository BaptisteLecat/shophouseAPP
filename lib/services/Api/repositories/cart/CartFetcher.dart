import 'dart:convert';

import 'package:shophouse/Model/Cart.dart';
import 'package:shophouse/Model/Product.dart';
import 'package:shophouse/services/Api/MainFetcher.dart';

class CartFetcher extends MainFetcher {
  CartFetcher() {
    this.setUserToken();
  }

  Future<List<Product>> getCartProductList(int id) async {
    final response = await this.get("cart/$id/products");
    print(response);
    return listProductFromJson(response);
  }

  Future<Cart> createCart(String cartName) async {
    final response = await this.post("carts", body: {"cartName": cartName});
    print(response);
    return Cart.fromJson(response);
  }

  Future<Cart> addProductInCart(
      {required int cartId,
      required int productId,
      required int quantity}) async {
    final response = await this.post("cart/$cartId/product/$productId",
        body: {"quantity": quantity.toString()});
    return Cart.fromJson(response);
  }

  Future<Cart> updateListProduct({required Cart cart}) async {
    final response = await this.patch(
      "cart/${cart.id}/products",
      body: cart.products,
    );
    return Cart.fromJson(response);
  }
}
