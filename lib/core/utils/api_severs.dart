import 'package:dio/dio.dart';

class ApiSevers {
  final _baserURl = 'https://www.googleapis.com/books/v1/ ';
  final Dio dio;

  ApiSevers(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_baserURl$endPoint');
    return response.data;
  }
}
