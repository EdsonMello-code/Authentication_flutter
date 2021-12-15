import 'package:authentication/app/features/auth/externals/datasources/services/client_http.dart';
import 'package:dio/dio.dart';

class DioHttpClient implements IHttpClient {
  final Dio dio;

  DioHttpClient({required this.dio});
  @override
  Future<Response> post(url, {Map<String, dynamic>? data}) {
    return dio.get(url);
  }
}
