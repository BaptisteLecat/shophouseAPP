import 'package:shophouse/services/Api/MainFetcher.dart';
import 'package:shophouse/Model/Category.dart';

class CategoryFetcher extends MainFetcher {
  Future<Categories> getCategoryList() async {
    final response = await this.get("categories");
    print(response);
    return Categories.fromJson(response);
  }

  Future<Category> getCategory(int id) async {
    final response = await this.get("category/$id");
    print(response);
    return Category.fromJson(response);
  }
}
