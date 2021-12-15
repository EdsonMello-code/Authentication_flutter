abstract class IHttpClient {
  Future<dynamic> post(url, {Map<String, dynamic>? data});
}
