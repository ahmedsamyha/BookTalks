import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessage: 'Connection time out, try again late');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send time out, try again late');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive time out, try again late');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad Certificate, try again late');
      case DioExceptionType.badResponse:
        return ServerFailure(errorMessage: 'Bad Response, try again late');
      case DioExceptionType.cancel:
        return ServerFailure(
            errorMessage: 'some thing went wrong, try again later');
      case DioExceptionType.connectionError:
        return ServerFailure(
            errorMessage: 'Please check your internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage: 'some thing went wrong, try again later');
    }
  }
}
