import 'package:shophouse/Model/AppUser.dart';
import 'package:shophouse/Model/Cart.dart';
import 'package:shophouse/services/Api/MainFetcher.dart';

class UserFetcher extends MainFetcher {
  UserFetcher() {
    this.setUserToken();
  }

  Future<Carts> getCarts() async {
    final response = await this.get("user/carts");
    print(response);
    return Carts.fromJson(response);
  }

  Future<AppUser> whoAmI({String? id, String? token}) async {
    final response = await this
        .post("login", body: (id != null) ? {"id": id} : {"token": token});
    print(response);
    return AppUser.fromJson(response);
  }

  Future<bool> register(
      String id, String name, String firstName, String email) async {
    bool registered = false;
    final response = await this.post("register",
        body: {"id": id, "name": name, "firstname": firstName, "email": email});
    print(response);
    if (response != null) {
      registered = true;
    }
    return registered;
  }
}
