import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        //Taking the api key and mode of language
        WeatherFactory wf =
            WeatherFactory(dotenv.get('API_KEY'), language: Language.ENGLISH);
        // getting the current position of the hone
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude
        );
        //returning Success Message state
        emit(WeatherSuccess(weather));
      } catch (e) {
        //returning Failure Message state
        emit(WeatherFailure());
      }
    });
  }
}
