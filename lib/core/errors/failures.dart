import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: ' Send Timeout with ApiService');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive Timeout wiht ApiService');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad Certificate with ApiService');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Cancel with ApiService');
      case DioExceptionType.connectionError:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure(errMessage: 'No Internet Connection');
        }
        return ServerFailure(
            errMessage: 'Unexpected Error, Please try again later');
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'Unknown with ApiService');

      default:
        return ServerFailure(errMessage: 'Opps, something went wrong');
    }
  }
  factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: "${response['error']['message']}");
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'your request not found , Please try again later');
    } else if (statusCode == 500) {
      return ServerFailure(
        errMessage: 'Internal Server Error,Please try again later',
      );
    } else {
      return ServerFailure(
          errMessage: 'Opps, something went wrong,Please try again later');
    }
  }
}
