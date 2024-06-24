import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/api/api_consumer.dart';
import 'package:weatherapp/core/errors/exception.dart';
import 'package:weatherapp/model/weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.api}) : super(WeatherInitial());

  final ApiConsumer api;

  Weather? weather;

  getDataWeather(String city) async {
    try {
      emit(WeatherLoaded());
      final response = await api
          .get("weather?q=$city&appid=376fe499d8223190a034bc7a89d44f90");
      weather = Weather.fromJson(response);

      emit(WeatherSuccess(weather: weather!));
    } on ServerException catch (e) {
      emit(WeatherFailure(errorMessage: e.errorModel.message));
    }
  }
}
