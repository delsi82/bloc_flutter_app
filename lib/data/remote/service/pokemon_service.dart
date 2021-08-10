import 'package:http/http.dart' as http;
import 'package:pokemon_flutter_app/data/app_keys.dart';

class AppService {
  static final AppService _instance = AppService._internal();

  AppService._internal();

  factory AppService() {
    return _instance;
  }

  Future<http.Response> get({required String endpoint}) {
    return http.get(Uri.parse(endpoint));
  }
}
