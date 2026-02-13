import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  // OpenWeatherMap API key
  static const String apiKey = '79b3d2b09b735bb1789a2c3f41df219e';

  Future<Weather> getWeather(String cityName) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'),
      );

      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception('City not found');
      } else if (response.statusCode == 401) {
        throw Exception('Invalid API key. Please get a free key from openweathermap.org');
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }

  Future<Weather> getWeatherByLocation(double latitude, double longitude) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'),
      );

      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }

  String getWeatherAnimation(String mainCondition) {
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return '☁️';
      case 'rain':
      case 'drizzle':
        return '🌧️';
      case 'thunderstorm':
        return '⛈️';
      case 'clear':
        return '☀️';
      case 'snow':
        return '❄️';
      default:
        return '🌤️';
    }
  }
}
