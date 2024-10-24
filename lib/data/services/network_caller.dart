import 'dart:convert';

import 'package:crafty_bay/data/services/network_response.dart';
import 'package:http/http.dart';

class NetworkCaller {
  static NetworkCaller? _instance;
  NetworkCaller._();
  factory NetworkCaller.getInstance() {
    _instance ??= NetworkCaller._();
    return _instance!;
  }
  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      final Uri uri = Uri.parse(url);
      Response response = await get(uri, headers: {'token': ""});
      if (response.statusCode == 200) {
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedBody);
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      final Uri uri = Uri.parse(url);
      Response response = await post(uri,
          headers: {'token': "", 'content-type': 'application/json'},
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedBody);
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMessage: e.toString());
    }
  }
}
