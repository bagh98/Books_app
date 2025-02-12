import 'package:dio/dio.dart';

class ApiService {
  final _baserURl = 'https://www.googleapis.com/books/v1/ ';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baserURl$endPoint');
    return response.data;
  }
}
