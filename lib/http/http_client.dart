import 'package:http/http.dart' as http;

abstract class IhttpClient {
  Future<http.Response> get({required String url});
  Future<http.Response> post({required String url, required String body, Map<String, String>? headers});
}

class HttpClient implements IhttpClient {
  final client = http.Client();

  @override
  Future<http.Response> get({required String url}) async {
    return client.get(Uri.parse(url));
  }

  @override
  Future<http.Response> post({required String url, required String body, Map<String, String>? headers}) async {
    return client.post(
      Uri.parse(url),
      body: body,
      headers: headers ?? {'Content-Type': 'application/json'}, 
    );
  }
}
