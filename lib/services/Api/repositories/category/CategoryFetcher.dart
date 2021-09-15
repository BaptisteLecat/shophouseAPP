import 'package:http/http.dart' as http;
import 'package:shophouse/services/Api/MainFetcher.dart';
import 'dart:convert';
import '../Model/WeatherData.dart';

class CategoryFetcher extends MainFetcher {
  /*Future<WeatherData> fetchData() async {
    final response = await http.get(Uri.parse(urlBuilder()));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //print(jsonDecode(response.body));
      return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load weatherData');
    }
  }*/
}
