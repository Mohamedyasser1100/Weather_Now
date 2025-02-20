import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_now/core/services/location_service.dart';
import 'package:weather_now/features/home/domain/entities/weather.dart';
import 'package:weather_now/features/home/domain/usecase/weather_use_case.dart';
import 'package:intl/intl.dart';

class HomeProvider extends ChangeNotifier {
  final GetWeatherUseCase getWeatherUseCase;
  Weather? weather;
  List<Forecast> forecast = [];
  bool isLoading = false;
  String? errorMessage;
  List<String> nextThreeDays = [];
  int selectedDayIndex = 0;
  String? selectedDay;

  HomeProvider({required this.getWeatherUseCase}) {
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      Position position = await LocationService.getCurrentLocation();
      forecast = await getWeatherUseCase.getThreeDayForecast(
          position.latitude, position.longitude);
      weather = await getWeatherUseCase(position.latitude, position.longitude);
      for (var i = 0; i < forecast.length; i++) {
        debugPrint(
            "Forecast $i: ${forecast[i].date} - ${DateFormat('EEEE').format(forecast[i].date)}");
      }
      nextThreeDays = getNextThreeDays();
    } catch (e) {
      debugPrint(e.toString());
      errorMessage = "Failed to fetch weather: ${e.toString()}";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<String> getNextThreeDays() {
    return forecast
        .map((e) => DateFormat('EEEE').format(e.date.toLocal()))
        .toSet()
        .toList();
  }

  void selectDay(int index) {
    selectedDayIndex = index;
    weather = Weather(
      cityName: weather!.cityName,
      temperature: forecast[index].temperature - 273.15,
      description: forecast[index].description,
      humidity: forecast[index].humidity,
      windSpeed: forecast[index].windSpeed,
      icon: forecast[index].icon,
      forecast: forecast,
      cloudiness: forecast[index].cloudiness,
    );

    notifyListeners();
  }
}
