import 'package:http/http.dart' as http;
import 'package:shophouse/services/Api/MainFetcher.dart';
import 'dart:convert';
import 'package:shophouse/Model/Category.dart';

class CategoryFetcher extends MainFetcher {
  Future<Categories> getCategoryList() async {
    final response =
        await this.get("categories");

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //print(jsonDecode(response.body));
      print(response.body);
      return Categories.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load category list');
    }
  }
}
