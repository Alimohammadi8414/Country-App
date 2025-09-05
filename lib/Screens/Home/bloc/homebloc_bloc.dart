import 'package:arz8/model/country.dart';
import 'package:arz8/services/methods.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc() : super(HomeblocInitial()) {
    on<HomeblocEvent>((event, emit) async {
      if (event is HomeStarted) {
        emit(Homeloading());
        try {
          emit(Homesuccess(await Services.getcountry()));
        } catch (e) {
          if (e is DioException) {
            emit(HomeError(e.message ?? "Unknown error"));
          } else {
            emit(HomeError(e.toString()));
          }
        }
      } else if (event is DropdownClicked) {
        emit(Homeloading());

        try {
          emit(Homesuccess(await Services.dropdown(event.slectedvalue)));
        } catch (e) {
          if (e is DioException) {
            emit(HomeError(e.message ?? "Unknown error"));
          } else {
            emit(HomeError(e.toString()));
          }
        }
      } else if (event is SearchByName) {
        emit(Homeloading());
        try {
          emit(Homesuccess(await Services.getcountrybyname(event.name)));
        } catch (e) {
          if (e is DioException) {
            emit(HomeError(e.message ?? "Unknown error"));
          } else {
            emit(HomeError(e.toString()));
          }
        }
      }
    });
  }
}
