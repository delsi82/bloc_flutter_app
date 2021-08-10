part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccess extends HomeState {
  final List<PokemonLight>? list;

  const HomeSuccess({this.list});

  @override
  List<Object> get props => [list ?? []];
}

class HomeLoadedNext extends HomeState {
  final List<PokemonLight>? list;

  const HomeLoadedNext({this.list});

  @override
  List<Object> get props => [list ?? []];
}

class HomeError extends HomeState {
  final String error;

  const HomeError({this.error = ""});

  @override
  List<Object> get props => [error];
}
