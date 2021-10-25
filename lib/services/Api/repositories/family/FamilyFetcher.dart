import 'package:shophouse/Model/Cart.dart';
import 'package:shophouse/Model/Family.dart';
import 'package:shophouse/services/Api/MainFetcher.dart';

class FamilyFetcher extends MainFetcher {
  FamilyFetcher() {
    this.setUserToken();
  }

  Future<Family> getFamilyById({required int familyId}) async {
    final response = await this.get("family$familyId");
    print(response);
    return Family.fromJson(response);
  }

  Future<Family> getFamilyOfUser() async {
    final response = await this.get("user/family");
    print(response);
    return Family.fromJson(response);
  }

  Future<Cart> getFamilyCart({required int familyId}) async {
    final response = await this.get("family/$familyId/cart");
    print(response);
    return Cart.fromJson(response);
  }
}
