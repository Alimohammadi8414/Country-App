part of 'homebloc_bloc.dart';

@immutable
sealed class HomeblocEvent {}

final class HomeStarted extends HomeblocEvent {
  final CountryModel country;
  HomeStarted(this.country);
}

final class DropdownClicked extends HomeblocEvent {
  final String slectedvalue;
  DropdownClicked(this.slectedvalue);
}

final class SearchByName extends HomeblocEvent {
  final String name;
  SearchByName(this.name);
}
