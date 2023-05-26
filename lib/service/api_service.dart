import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class APIService {
  static const List<String> url = [
    'http://194.116.172.13:5000',
    'http://194.116.172.13:5000'
  ];

  static Future<dynamic> postRequest({
    required String request,
    Map<String, String> queryParameters = const {},
    Map<String, String> data = const {},
    int serverIndex = 0,
  }) async {
    try {
      print('${url[serverIndex]}/$request');
      var response = await Dio().post('${url[serverIndex]}/$request',
          queryParameters: queryParameters, data: data);
      debugPrint(response.toString());
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      debugPrint(e.toString());
      return '';
    }
    return '';
  }

  static Future<dynamic> getRequest({
    required String request,
    Map<String, String> queryParameters = const {},
    int serverIndex = 0,
  }) async {
    try {
      var response = await Dio().get('${url[serverIndex]}/$request',
          queryParameters: queryParameters);
      debugPrint(response.toString());
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      debugPrint(e.toString());
      return '';
    }
    return '';
  }

  static Future<dynamic> putRequest({
    required String request,
    Map<String, String> queryParameters = const {},
    Map<String, String> data = const {},
    int serverIndex = 0,
  }) async {
    try {
      var response = await Dio().put('${url[serverIndex]}/$request',
          queryParameters: queryParameters, data: data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return '';
    }
    return '';
  }
}
