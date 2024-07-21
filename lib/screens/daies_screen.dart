import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app_flutter/cubits/get_current_weather_cubit/current_city_weather_cubit.dart';
import 'package:weather_forecast_app_flutter/models/weather_model.dart';
import 'package:weather_forecast_app_flutter/widgets/daies_list_widget.dart';
import 'package:weather_forecast_app_flutter/widgets/drawer_widget.dart';

class DaiesScreen extends StatefulWidget {
  const DaiesScreen({super.key});

  @override
  State<DaiesScreen> createState() => _DaiesScreenState();
}

class _DaiesScreenState extends State<DaiesScreen> {
  WeatherModel? currentCityWeather;

  @override
  void initState() {
    super.initState();
    currentCityWeather = BlocProvider.of<CurrentCityWeatherCubit>(context)
        .getCurrentCityWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        title: const Text('WeatherForecast'),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      // body of daies screen
      body: BlocBuilder<CurrentCityWeatherCubit, CurrentCityWeatherState>(
        builder: (context, state) {
          if (state is CurrentCityWeatherLoaded) {
            currentCityWeather = state.weatherModel;
            return DaiesListWidget(currentCityWeather: currentCityWeather);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
