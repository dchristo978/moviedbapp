import 'package:dio/dio.dart';
import 'package:moviedbapp/network/AppInterceptors.dart';
import 'package:moviedbapp/network/index.dart';

class Api {
  final dio = createDio();

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: Url.baseUrl,
      headers: {
        'authorization': 'Bearer ${Url.bearerAuthorization}',
        'accept': 'application/json'
      },
      receiveTimeout: const Duration(seconds: 15),
      // 15 seconds
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });

    return dio;
  }
}
