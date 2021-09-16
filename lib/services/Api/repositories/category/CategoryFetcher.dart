import 'package:http/http.dart' as http;
import 'package:shophouse/services/Api/MainFetcher.dart';
import 'dart:convert';
import 'package:shophouse/Model/Category.dart';
import 'package:shophouse/common/error/AppException.dart';

class CategoryFetcher extends MainFetcher {
  Future<Categories> getCategoryList() async {
    final response = await this.get("categoriesd");
    print(response);
    return Categories.fromJson(jsonDecode(response));
  }
}
