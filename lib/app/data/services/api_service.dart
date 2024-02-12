import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' as g;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../end_point/api_endpoints.dart';

class ApiService {
  static ApiService get instance => ApiService();
  late final Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        connectTimeout: 90.seconds,
      ),
    );

    /// show logs of response only in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
        ),
      );
    }
  }

  /// get method to fetch data from server
  Future<Response> get(String url) async {
    try {
      _checkNetworkStatus();
      final response = await _dio.get(url);

      return response;
    } on DioException catch (error, st) {
      log("error from get ==> $error , st ==> $st");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> parseAssetJson(String path) async {
    Map<String, dynamic> data = {};
    try {
      String jsonString = await rootBundle.loadString(path);

      data = json.decode(jsonString);
    } catch (e) {
      log('Error loading JSON: $e');
    }
    return data;
  }

  /// method to check network status
  void _checkNetworkStatus() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw DioException(
        type: DioExceptionType.connectionError,
        error: "No internet connection",
        requestOptions: RequestOptions(),
      );
    }
  }
}
