import 'package:get/get.dart';

class RestClient extends GetConnect {
  String baseUrl = 'https://api-pizza-delivery.herokuapp.com';

  RestClient() {
    httpClient.baseUrl = baseUrl;
  }
}

class RestClientException implements Exception {
  final int code;
  final String message;

  RestClientException(this.message, {this.code});

  @override
  String toString() {
    return super.toString();
  }
}
