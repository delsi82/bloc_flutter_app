import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/ui/routing/app_route_path.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location != null) {
      final uri = Uri.parse(routeInformation.location!);
      // Handle '/'
      if (uri.pathSegments.length == 0) {
        return AppRoutePath.home();
      }

      // Handle '/book/:id'

    }
    // Handle unknown routes
    return AppRoutePath.unknow();
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath path) {
    if (path.path == "/") {
      return RouteInformation(location: '/');
    }

    return null;
  }
}
