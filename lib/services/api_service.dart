import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/api_endpoints.dart';

enum RequestType { get, post, put, patch, delete }

extension ParseToString on RequestType {
  String get value {
    switch (this) {
      case RequestType.get:
        return 'GET';

      case RequestType.post:
        return 'POST';

      case RequestType.put:
        return 'PUT';

      case RequestType.patch:
        return 'PATCH';

      case RequestType.delete:
        return 'DELETE';
    }
  }
}

class ApiService {
  ApiService._();

  static void callApi(
    String endpoint,
    RequestType requestType, {
    Map<String, dynamic>? requestBody,
    required Function(dynamic) onSuccess,
    required VoidCallback onFailed,
  }) async {
    if (requestType == RequestType.get && requestBody != null) {
      throw Exception('Invalid Request Body');
    }

    final url = ApiEndpoints.baseUrl + endpoint;

    final response = await callApiForRequestType(
      url,
      requestType,
      requestBody,
    );

    print('___ENDPOINT___');
    print(url);
    print('___STATUS_CODE___');
    print(response.statusCode);
    print('___RESPONSE___');
    print(response.body);

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      onSuccess(responseBody);
    } else {
      onFailed();
    }
  }

  static callApiForRequestType(String url, RequestType requestType, Map<String, dynamic>? requestBody) {
    final requestUrl = Uri.parse(url);

    switch (requestType) {
      case RequestType.get:
        return http.get(requestUrl);

      case RequestType.post:
        return http.post(requestUrl, body: requestBody);

      case RequestType.put:
        return http.put(requestUrl, body: requestBody);

      case RequestType.patch:
        return http.patch(requestUrl, body: requestBody);

      case RequestType.delete:
        return http.delete(requestUrl, body: requestBody);
    }
  }
}
