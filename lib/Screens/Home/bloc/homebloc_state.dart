part of 'homebloc_bloc.dart';

@immutable
sealed class HomeblocState {}

final class HomeblocInitial extends HomeblocState {}

final class Homesuccess extends HomeblocState {
  final List<CountryModel> countries;
  Homesuccess(this.countries);
}

final class HomeError extends HomeblocState {
  final String error;
  HomeError(this.error);
}

final class Homeloading extends HomeblocState {}
