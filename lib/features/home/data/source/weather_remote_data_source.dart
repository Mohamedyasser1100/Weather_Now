import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_now/core/constant/api_constant.dart';
import 'package:weather_now/features/home/data/model/weather_model.dart';
import 'package:weather_now/features/home/domain/entities/weather.dart';

class WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSource(this.client);

  Future<Weather> fetchCurrentWeather(double latitude, double longitude) async {
    final response = await client.get(
      Uri.parse(
          '${ApiConstant.baseUrl}/weather?lat=$latitude&lon=$longitude&appid=${ApiConstant.apiKey}&units=metric'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel.fromJson(data).toEntity();
    } else {
      throw Exception('Failed to load current weather');
    }
  }

  Future<List<Forecast>> fetchWeatherForecast(
      double latitude, double longitude) async {
    final response = await client.get(
      Uri.parse(
          '${ApiConstant.baseUrl}/forecast?lat=$latitude&lon=$longitude&cnt=3&appid=${ApiConstant.apiKey}'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Forecast> forecast = (data['list'] as List)
          .map((day) => ForecastModel.fromJson(day).toEntity())
          .toList();
      return forecast;
    } else {
      throw Exception('Failed to load weather forecast');
    }
  }
}
