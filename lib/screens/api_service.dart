import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://your-api-url.com/api/',
      connectTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Response> getServices() async {
    return await dio.get('services');
  }
}