import 'package:flutter/material.dart';
import 'package:weather_forecast_app_flutter/models/weather_model.dart';
import 'package:weather_forecast_app_flutter/widgets/city_info_list_widget.dart';

class CityInfoScreen extends StatelessWidget {
  const CityInfoScreen({super.key, required this.weatherModel});
  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherForecast'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: CityInfoListWidget(weatherModel: weatherModel),
    );
  }
}
