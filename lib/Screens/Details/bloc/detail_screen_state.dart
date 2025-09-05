part of 'detail_screen_bloc.dart';

@immutable
sealed class DetailScreenState {}

final class DetailScreenInitial extends DetailScreenState {}

final class DetialScreenSuccess extends DetailScreenState {
  final CountryModel countryModel;
  DetialScreenSuccess(this.countryModel);
}

final class DetialScreenLoading extends DetailScreenState {}

final class DetialScreenError extends DetailScreenState {
  final String error;
  DetialScreenError(this.error);
}
