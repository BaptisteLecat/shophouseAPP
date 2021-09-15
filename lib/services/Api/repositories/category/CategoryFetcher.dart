import 'package:http/http.dart' as http;
import 'package:shophouse/services/Api/MainFetcher.dart';
import 'dart:convert';
import 'package:shophouse/Model/Category.dart';

class CategoryFetcher extends MainFetcher {
  Future<Categories> getCategoryList() async {
    final response =
        await http.get(Uri.parse(this.urlBuilder("categories")), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "x-auth-token": "${this.userToken}",
    });

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
