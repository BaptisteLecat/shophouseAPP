import 'package:shophouse/Model/Cart.dart';
import 'package:shophouse/services/Api/MainFetcher.dart';

class UserFetcher extends MainFetcher {
  Future<Carts> getCarts() async {
    final response = await this.get("user/carts");
    print(response);
    return Carts.fromJson(response);
  }
}
