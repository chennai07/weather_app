import 'dart:convert';
import 'package:http/http.dart' as http;

const String kApiKey = '24b69ac7beab2585a0b8c6dbbca7f304'; // Replace with your API key
const String kWeatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  // Method to get weather data for a city
  Future<dynamic> getCityWeather(String cityName) async {
    final url = '$kWeatherApiUrl?q=$cityName&appid=$kApiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  // Method to get weather data for the current location
  Future<dynamic> getLocationWeather(double latitude, double longitude) async {
    final url = '$kWeatherApiUrl?lat=$latitude&lon=$longitude&appid=$kApiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  // Method to get the weather icon based on condition code
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩'; // Thunderstorm
    } else if (condition < 400) {
      return '🌧'; // Drizzle
    } else if (condition < 600) {
      return '☔️'; // Rain
    } else if (condition < 700) {
      return '☃️'; // Snow
    } else if (condition < 800) {
      return '🌫'; // Fog
    } else if (condition == 800) {
      return '☀️'; // Clear
    } else if (condition <= 804) {
      return '☁️'; // Clouds
    } else {
      return '🤷‍'; // Unknown
    }
  }

  // Method to get a weather message based on temperature
  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
