import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter_app/ui/home/bloc/home_bloc.dart';
import 'package:pokemon_flutter_app/ui/home/home_view.dart';

class AppNavigator {
  static final AppNavigator _instance = AppNavigator._internal();

  late Navigator _navigator;

  AppNavigator._internal() {
    _navigator = Navigator(
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

  factory AppNavigator() {
    return _instance;
  }

  Navigator getNavigator() {
    return _navigator;
  }
}
