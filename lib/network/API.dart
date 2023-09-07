import 'package:dio/dio.dart';
import 'package:moviedbapp/network/AppInterceptor.dart';

class Api {
  final dio = createDio();
  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      receiveTimeout: const Duration(seconds: 15), // 15 seconds
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });

    return dio;
  }
}