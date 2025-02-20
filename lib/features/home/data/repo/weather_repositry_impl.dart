import 'package:weather_now/features/home/data/source/weather_remote_data_source.dart';
import 'package:weather_now/features/home/domain/entities/weather.dart';
import 'package:weather_now/features/home/domain/repo/weather_repositry.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<Weather> getCurrentWeather(double latitude, double longitude) async {
    return await remoteDataSource.fetchCurrentWeather(latitude, longitude);
  }

  @override
  Future<List<Forecast>> getWeatherForecast(
      double latitude, double longitude) async {
    return await remoteDataSource.fetchWeatherForecast(latitude, longitude);
  }
}
