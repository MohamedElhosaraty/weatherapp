part of 'weather_cubit.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoaded extends WeatherState {}

final class WeatherSuccess extends WeatherState {

   final Weather weather;

  WeatherSuccess({required this.weather});
}

final class WeatherFailure extends WeatherState {

   final String errorMessage;

  WeatherFailure({required this.errorMessage});
}

