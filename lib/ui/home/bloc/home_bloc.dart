import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_flutter_app/data/models/pokemon_light.dart';
import 'package:pokemon_flutter_app/data/remote/dto/pokemon.dart';
import 'package:pokemon_flutter_app/data/repository/pokemon_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  PokemonRepository _repository = PokemonRepository();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    switch (event.runtimeType) {
      case HomeInit:
        yield* loadPokemonList();
    }
  }

  Stream<HomeState> loadPokemonList() async* {
    yield HomeLoading();

    try {
      yield HomeSuccess(list: await _repository.getPokemonList());
    } catch (e) {
      yield HomeError(error: e.toString());
    }
  }
}
