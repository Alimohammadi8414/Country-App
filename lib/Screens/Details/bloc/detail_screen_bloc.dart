import 'package:arz8/model/country.dart';
import 'package:arz8/services/methods.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'detail_screen_event.dart';
part 'detail_screen_state.dart';

class DetailScreenBloc extends Bloc<DetailScreenEvent, DetailScreenState> {
  DetailScreenBloc() : super(DetailScreenInitial()) {
    on<DetailScreenEvent>((event, emit) async {
      if (event is DetailScreenStarted) {
        emit(DetialScreenLoading());
        try {
          emit(DetialScreenSuccess(event.countryModel));
        } catch (e) {
          emit(DetialScreenError('Somthing went wrong'));
        }
      }
      if (event is BorderCountryClicked) {
        emit(DetialScreenLoading());
        try {
          final countries = await Services.codeserach(event.countryCode);
          emit(DetialScreenSuccess(countries.first));
        } catch (e) {
          emit(DetialScreenError('Somthing went wrong'));
        }
      }
    });
  }
}
