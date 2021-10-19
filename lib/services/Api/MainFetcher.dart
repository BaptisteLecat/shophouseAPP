import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shophouse/common/error/api/ApiException.dart';
import 'dart:convert';

import 'package:shophouse/services/Auth/SharedPreferences.dart';

class MainFetcher {
  static String userToken = "noToken";
  String apiUrl = "https://shophouse.alwaysdata.net";

  String _urlBuilder(String subUrl) {
    return "${this.apiUrl}/$subUrl";
  }

  setUserToken() async {
    await SharedPreferencesUser().getToken().then((value) {
      print("test");
      MainFetcher.userToken = value!;
    }).onError((error, stackTrace) {
      throw Exception("Aucun token fournit.");
    });
  }

  Future<dynamic> get(String url, [Map<String, String>? headers]) async {
    print(MainFetcher.userToken);
    var responseJson;
    try {
      print(_urlBuilder(url));
      final response = await http.get(Uri.parse(_urlBuilder(url)),
          headers: headers == null
              ? {
                  "Content-Type": "application/json",
                  "Accept": "application/json",
                  "Authorization": "Bearer ${MainFetcher.userToken}"
                }
              : headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: 'No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    var responseJson;
    try {
      print(_urlBuilder(url));
      final response = await http.post(Uri.parse(_urlBuilder(url)),
          headers: headers == null
              ? {
                  "Accept": "application/json",
                  "Content-Type": "application/x-www-form-urlencoded",
                  "Authorization": "Bearer ${MainFetcher.userToken}"
                }
              : headers,
          body: body,
          encoding: Utf8Codec());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: 'No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> patch(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    var responseJson;
    try {
      print(_urlBuilder(url));
      final response = await http.patch(Uri.parse(_urlBuilder(url)),
          headers: headers == null
              ? {
                  "Accept": "application/json",
                  "Content-Type": "application/x-www-form-urlencoded",
                  "Authorization": "Bearer ${MainFetcher.userToken}"
                }
              : headers,
          body: jsonEncode(body),
          encoding: Utf8Codec());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: 'No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    var returnedResponse = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        print("success");
        return returnedResponse;
      case 400:
        throw BadRequestException(message: returnedResponse["message"]);
      case 404:
        throw BadRequestException(message: returnedResponse["message"]);
      case 403:
        throw UnauthorisedException(message: returnedResponse["message"]);
      case 500:
      default:
        throw FetchDataException(
            message: "${returnedResponse["message"]} : ${response.statusCode}");
    }
  }
}
