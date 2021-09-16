import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shophouse/common/error/api/ApiException.dart';
import 'dart:convert';

class MainFetcher {
  String userToken = "15sdf";
  String apiUrl = "https://shophouse.alwaysdata.net";

  String _urlBuilder(String subUrl) {
    return "${this.apiUrl}/$subUrl";
  }

  Future<dynamic> get(String url, [Map<String, String>? headers]) async {
    var responseJson;
    try {
      print(_urlBuilder(url));
      final response = await http.get(Uri.parse(_urlBuilder(url)),
          headers: headers == null
              ? {
                  "Content-Type": "application/json",
                  "Accept": "application/json",
                  "X-AUTH-TOKEN": this.userToken
                }
              : headers);
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
            message:
                'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
