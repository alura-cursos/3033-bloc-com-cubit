part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {
  HomeSuccess(this.movies);

  final List<Movie> movies;
}

class HomeError extends HomeStates {
  HomeError(this.error);

  final String error;
}
