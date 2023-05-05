import 'package:dio/dio.dart';
import 'package:dio_clients/src/interceptors/logging_interceptor.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClientNoAuthorization {
  final Dio dio;
  DioClientNoAuthorization(String baseUrl)
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
          ),
        ) {
    dio.interceptors.add(Logging());
    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: debugPrint, // specify log function (optional)
        retries: 4, // retry count (optional)
        retryDelays: const [
          // set delays between retries (optional)
          Duration(seconds: 1), // wait 1 sec before the first retry
          Duration(seconds: 2), // wait 2 sec before the second retry
          Duration(seconds: 3), // wait 3 sec before the third retry
          Duration(seconds: 4), // wait 4 sec before the fourth retry
        ],
      ),
    );
  }

  Future<Response> get(String path ) async {
    return await dio.get(path,
        options: Options(
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ));
  }

  Future<Response> getWithPARAMS(String path,{required Map<String, String> queryParameters}) async {
    return await dio.get(
      path,
      options: Options(
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
      queryParameters: queryParameters,
    );
  }

  Future<Response> post(String path,
      {required Map<String, dynamic> data}) async {
    return await dio.post(path,
        data: data,
        options: Options(
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ));
  }

  Future<Response> put(String path, {required Map data}) async {
    return await dio.put(path,
        data: data,
        options: Options(
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ));
  }
}
