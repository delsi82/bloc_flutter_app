import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter_app/data/app_keys.dart';
import 'package:pokemon_flutter_app/ui/home/bloc/home_bloc.dart';
import 'package:pokemon_flutter_app/ui/home/home_view.dart';
import 'package:pokemon_flutter_app/ui/routing/app_route_path.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  String _viewId = "";

  AppRoutePath get currentConfiguration {
    switch (_viewId) {
      case AppKeys.HOME:
        return AppRoutePath.home();
      default:
        return AppRoutePath.unknow();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Navigator(
      pages: [
        MaterialPage(
          key: ValueKey('Home'),
          child: BlocProvider(
            create: (_) => HomeBloc(),
            child: HomeView(),
          ),
        )
      ],
      onPopPage: (route, result) => route.didPop(result),
    );
  }

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState>? get navigatorKey => throw UnimplementedError();

  @override
  Future<void> setNewRoutePath(AppRoutePath path) async {
    return;
  }
}
