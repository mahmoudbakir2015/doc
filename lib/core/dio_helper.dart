import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:doc/core/cashe_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constant/constants.dart';

class DioHelper {
  static Dio? dio;
  static Dio? dioGoogleMap;

  static init({bool isBaseUrl = true}) {
    dio = Dio(
      BaseOptions(
          baseUrl: Constants.baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            // "Authorization":
            //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3NpbHZlci50YWctc29mdC5jb20vYXBpL3YxL3VzZXIvbG9naW5fcGhvbmUiLCJpYXQiOjE2OTUyMDA1OTgsImV4cCI6MTY5NTIwNDE5OCwibmJmIjoxNjk1MjAwNTk4LCJqdGkiOiJKalZaRDFpamEwQUxRb0ZIIiwic3ViIjoiMyIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.LW268CmC9lsmD7wsZ8689MVYT9ZXhP1AVcqgUZAc4to",
            // "Authorization": 'Bearer ${CacheHelper.getData(key: "Token")}',
            'Content-Type': 'application/json',
            // "lang": CacheHelper.getData(key: "lang") == "ar_EG" ? "ar" : "en",
            "Accept": "application/json"
          }),
    );
    dioGoogleMap = Dio(
      BaseOptions(
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            // "Authorization": 'Bearer ${CacheHelper.getData(key: "Token")}',
            'Content-Type': 'application/json',
            // "lang": CacheHelper.getData(key: "lang") == "ar_EG" ? "ar" : "en",
            "Accept": "application/json"
          }),
    );

    dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    dio!.interceptors.add(ErrorInterceptor());
    dioGoogleMap!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    dioGoogleMap!.interceptors.add(ErrorInterceptor());
  }

  static Future<Response> postData({
    required String endPoint,
    required dynamic data,
    String? authorization,
  }) {
    return dio!.post(endPoint,
        data: data,
        options: Options(headers: {
          "Authorization": 'Bearer $authorization',
          'Content-Type': 'application/json',
          // "lang": CacheHelper.getData(key: "lang") == "ar_EG" ? "ar" : "en",
          "Accept": "application/json"
        }));
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) {
    return dio!.get(
      endPoint,
      queryParameters: queryParameters,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.put(url, queryParameters: data);
  }

  static Future<Response> requestData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.request(url, queryParameters: data);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  // ignore: deprecated_member_use
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      log("statusCode == 401");
    } else if (err.response?.statusCode == 403) {
      log("statusCode == 403");
    } else {
      log("statusCode == 500${err.response?.statusCode!}");
    }
    return super.onError(err, handler);
  }
}
