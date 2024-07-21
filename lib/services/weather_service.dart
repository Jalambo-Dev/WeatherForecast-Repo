import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_forecast_app_flutter/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const baseURL = 'http://api.weatherapi.com/v1';
  final String apiKey = '9d95bb4ec7d54aea857111827232510';

  Future<WeatherModel> getWeather(String cityName) async {
    final response = await http.get(Uri.parse(
        '$baseURL/forecast.json?key=$apiKey&q=$cityName&days=3&aqi=no&alerts=no'));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<WeatherModel>> getCitiesWeather(List<String> citiesName) async {
    List<WeatherModel> weatherModels = [];
    for (var i = 0; i < citiesName.length; i++) {
      weatherModels.add(await getWeather(citiesName[i]));
    }
    return weatherModels;
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemarks[0].locality;
    return city ?? "";
  }

  Future<WeatherModel> getCurrentCityWeather() async {
    String cityName = await WeatherService().getCurrentCity();
    WeatherModel weatherModel = await WeatherService().getWeather(cityName);
    return weatherModel;
  }

  String getWeatherAnimation(String condition) {
    switch (condition.toLowerCase()) {
      case 'partly cloudy':
      case 'partly cloudy ':
        return 'assets/lottie/partlyCloudy.json';
      case 'clear ':
        return 'assets/lottie/clear.json';
      case 'mist':
      case 'fog':
        return 'assets/lottie/mist.json';
      case 'rainny':
      case 'patchy light rain':
      case 'light rain':
      case 'moderate rain at times':
      case 'moderate rain':
      case 'patchy rain nearby':
      case 'heavy rain at times':
      case 'light freezing rain':
      case 'moderate or heavy freezing rain':
      case 'heavy rain':
      case 'light rain shower':
      case 'moderate or heavy rain in area with thunder':
      case 'moderate or heavy showers of ice pellets':
      case 'patchy light rain in area with thunder':
      case 'moderate or heavy rain shower':
      case 'torrential rain shower':
      case 'moderate or heavy sleet showers':
        return 'assets/lottie/rainny.json';
      case 'snow':
      case 'light sleet':
      case 'moderate snow':
      case 'patchy heavy snow':
      case 'moderate or heavy sleet':
      case 'patchy light snow':
      case 'light snow showers':
      case 'heavy snow':
      case 'ice pellets':
      case 'light snow':
      case 'moderate or heavy snow in area with thunder':
      case 'patchy light snow in area with thunder':
      case 'patchy moderate snow':
      case 'blowing snow':
      case 'light showers of ice pellets':
      case 'moderate or heavy snow showers':
      case 'blizzard':
      case 'patchy snow nearby':
      case 'patchy sleet nearby':
      case 'patchy freezing drizzle nearby':
        return 'assets/lottie/snow.json';
      case 'storm':
      case 'thundery outbreaks in nearby':
        return 'assets/lottie/storm.json';
      case 'sunny':
        return 'assets/lottie/sunny.json';
      case 'thunder':
        return 'assets/lottie/thunder.json';
      case 'windy':
      case 'cloudy':
      case 'overcast':
        return 'assets/lottie/windy.json';
      default:
        return 'assets/lottie/no_weather.json';
    }
  }
}
