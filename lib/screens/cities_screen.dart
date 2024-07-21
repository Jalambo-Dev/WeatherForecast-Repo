import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app_flutter/cubits/get_cities_weather_cubit/cities_weather_cubit.dart';
import 'package:weather_forecast_app_flutter/models/weather_model.dart';
import 'package:weather_forecast_app_flutter/widgets/cities_weather_widget.dart';
import 'package:weather_forecast_app_flutter/widgets/drawer_widget.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  List<WeatherModel>? citiesWeatherModels;
  List<String> citiesName = [
    'Jerusalem',
    'Dubai',
    'Riyadh',
    'Cairo',
    'Beirut',
    'Moscow',
    'Tokyo',
    'Cape Town',
    'Rio de Janeiro',
    'Mumbai',
    'Ottawa',
    'New York',
    'Los Angeles',
    'Sydney',
  ];

  @override
  void initState() {
    super.initState();
    citiesWeatherModels = BlocProvider.of<CitiesWeatherCubit>(context)
        .getCitiesWeather(citiesName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherForecast'),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: BlocBuilder<CitiesWeatherCubit, CitiesWeatherState>(
        builder: (context, state) {
          if (state is CitiesWeatherLoaded) {
            citiesWeatherModels = (state).weatherModels;
            return CitiesWeatherWidget(weatherModels: citiesWeatherModels);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
