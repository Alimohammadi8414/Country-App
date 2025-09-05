part of 'detail_screen_bloc.dart';

@immutable
sealed class DetailScreenEvent {}

final class DetailScreenStarted extends DetailScreenEvent {
  final CountryModel countryModel;
  DetailScreenStarted(this.countryModel);
}

final class BorderCountryClicked extends DetailScreenEvent {
  final String countryCode;
  BorderCountryClicked(this.countryCode);
}
