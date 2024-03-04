part of 'weather_bloc.dart';

sealed class WeatherBlocState extends Equatable{
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherBlocState {}
final class WeatherLoading extends WeatherBlocState {}
final class WeatherFailure extends WeatherBlocState {}
final class WeatherSuccess extends WeatherBlocState {
  final Weather weather;
  const WeatherSuccess(this.weather);

  @override
  List<Object> get props => [weather];
}

