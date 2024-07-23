import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app_flutter/cubits/get_current_weather_cubit/current_city_weather_cubit.dart';
import 'package:weather_forecast_app_flutter/models/weather_model.dart';
import 'package:weather_forecast_app_flutter/widgets/drawer_widget.dart';
import 'package:weather_forecast_app_flutter/widgets/hours_list_widget.dart';

class HoursScreen extends StatefulWidget {
  const HoursScreen({super.key});

  @override
  State<HoursScreen> createState() => _HoursScreenState();
}

class _HoursScreenState extends State<HoursScreen> {
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
      // body of hourly screen
      body: BlocBuilder<CurrentCityWeatherCubit, CurrentCityWeatherState>(
        builder: (context, state) {
          if (state is CurrentCityWeatherLoaded) {
            currentCityWeather = state.weatherModel;
            return HoursListWidget(currentCityWeather: currentCityWeather);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
