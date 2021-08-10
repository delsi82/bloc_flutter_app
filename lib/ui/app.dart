import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/ui/routing/app_route_information_parser.dart';
import 'package:pokemon_flutter_app/ui/routing/app_router_delegate.dart';
import 'package:pokemon_flutter_app/utils/theme_colors.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AppView();
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  AppRouterDelegate _routerDelegate = AppRouterDelegate();
  AppRouteInformationParser _appRouteInformationParser =
      AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp.router(
        title: "Pokemon App Flutter",
        theme: ThemeData(primaryColor: ThemeColors.primary),
        routeInformationParser: _appRouteInformationParser,
        routerDelegate: _routerDelegate);
  }
}
