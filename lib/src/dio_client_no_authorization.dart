import 'package:dio/dio.dart';
import 'package:dio_clients/src/interceptors/logging_interceptor.dart';
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
  }

  Future<Response> get(String path) async {
    return await dio.get(path,
        options: Options(
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            // 'Authorization': auth,
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ));
  }

  Future<Response> post(String path,
      {required Map<String, dynamic> data}) async {
    return await dio.post(path,
        data: data,
        options: Options(
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            // 'Authorization': auth,
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
            // 'Authorization': auth,
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ));
  }
}
