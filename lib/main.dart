import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app_flutter/cubits/get_cities_weather_cubit/cities_weather_cubit.dart';
import 'package:weather_forecast_app_flutter/cubits/get_current_weather_cubit/current_city_weather_cubit.dart';
import 'package:weather_forecast_app_flutter/screens/cities_screen.dart';
import 'package:weather_forecast_app_flutter/screens/daily_screen.dart';
import 'package:weather_forecast_app_flutter/screens/home_screen.dart';
import 'package:weather_forecast_app_flutter/screens/hourly.dart';
import 'package:weather_forecast_app_flutter/screens/launch_screen.dart';
import 'package:weather_forecast_app_flutter/services/weather_service.dart';

void main(List<String> args) {
  runApp(const WeatherForecastApp());
}

class WeatherForecastApp extends StatelessWidget {
  const WeatherForecastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentCityWeatherCubit(WeatherService()),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Tajawal'),
        initialRoute: '/launch_screen',
        routes: {
          '/launch_screen': (context) => const LaunchScreen(),
          '/home_screen': (context) => const HomeScreen(),
          '/hourly_screen': (context) => const HoursScreen(),
          '/daily_screen': (context) => const DaiesScreen(),
          '/cities_screen': (context) => BlocProvider(
                create: (context) => CitiesWeatherCubit(WeatherService()),
                child: const CitiesScreen(),
              ),
        },
      ),
    );
  }
}
