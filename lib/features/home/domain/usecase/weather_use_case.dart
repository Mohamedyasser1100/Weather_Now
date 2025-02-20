import 'package:weather_now/features/home/domain/entities/weather.dart';
import 'package:weather_now/features/home/domain/repo/weather_repositry.dart';

class GetWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetWeatherUseCase(this.weatherRepository);

  Future<Weather> call(double latitude, double longitude) async {
    return await weatherRepository.getCurrentWeather(latitude, longitude);
  }

  Future<List<Forecast>> getThreeDayForecast(
      double latitude, double longitude) async {
    return await weatherRepository.getWeatherForecast(latitude, longitude);
  }
}
