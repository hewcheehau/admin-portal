import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// Custom http response model
abstract class DioResponse {
  DioResponse({
    required this.response,
    this.url,
  });

  final Response response;
  final String? url;

  int get statusCode => response.statusCode ?? 400;

  get data {
    return response.data;
  }
  
  bool get isSuccess => statusCode == 200;

  get printSingle {
    var encoder = const JsonEncoder.withIndent("  ");
    var jsonObjJmap = response.data as Map;
    var jsonStr = encoder.convert(jsonObjJmap);
    debugPrint("$url\n$jsonStr");
  }

}

class SuccessResponse extends DioResponse {
  SuccessResponse({required super.response, super.url});
}