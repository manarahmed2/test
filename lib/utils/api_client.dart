import 'package:http/http.dart' as http;

class ApiClient {
  static final _instance = ApiClient._internal();

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal();

  Future<http.Response> get(String url) async {
    return await http.get(Uri.parse(url));
  }
}
