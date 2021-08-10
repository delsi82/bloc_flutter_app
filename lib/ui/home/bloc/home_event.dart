part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeInit extends HomeEvent {

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeLoadNext extends HomeEvent {
  final int numberRow;

  const HomeLoadNext({required this.numberRow});

  @override
  // TODO: implement props
  List<Object> get props => [this.numberRow];
}
