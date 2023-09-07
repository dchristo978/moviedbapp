import 'package:dio/dio.dart';
import 'package:moviedbapp/core/utils/FToast.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw NoInternetConnectionException(err.requestOptions);

      default:
        if (err.response != null) {
          switch (err.response?.statusCode) {
            case 400:
              FToast().errorToast('Invalid request');

              throw BadRequestException(err.requestOptions);
            case 401:
              FToast().errorToast('Access denied');

              throw UnauthorizedException(err.requestOptions);
            case 404:
              FToast()
                  .errorToast('The requested information could not be found');

              throw NotFoundException(err.requestOptions);
            case 409:
              FToast().errorToast('Conflict Occured');

              throw ConflictException(err.requestOptions);
            case 500:
              FToast().errorToast(
                  'Server side error occurred, please try again later.');
              throw InternalServerErrorException(err.requestOptions);
          }
        } else {
          throw NoInternetConnectionException(err.requestOptions);
        }
        break;
    }

    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Server side error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
