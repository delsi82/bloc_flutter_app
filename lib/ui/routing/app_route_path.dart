import 'package:pokemon_flutter_app/data/app_keys.dart';

class AppRoutePath {
  String path = "/";
  late final String id;

  late final bool isUnknow;

  AppRoutePath.home() : path = "/";

  AppRoutePath.detail(this.id) : path = AppKeys.POKEMON + "/$id";

  AppRoutePath.unknow() : isUnknow = true;
}
