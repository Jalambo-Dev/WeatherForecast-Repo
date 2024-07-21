import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_forecast_app_flutter/models/weather_model.dart';
import 'package:weather_forecast_app_flutter/services/weather_service.dart';

class CityWeatherWidget extends StatelessWidget {
  const CityWeatherWidget({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // my location
          const Icon(
            Icons.location_on,
            size: 28,
          ),

          const SizedBox(
            height: 20,
          ),

          // current location (city)
          Text(
            weatherModel!.cityName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          // current location (city)
          Text(
            weatherModel!.countryName,
            style: const TextStyle(fontSize: 18),
          ),

          // current condition icon
          Lottie.asset(
              WeatherService().getWeatherAnimation(weatherModel!.condition)),

          // current condition text
          Text(
            weatherModel!.condition,
            style: const TextStyle(fontSize: 22),
          ),
          // current tempreature

          Text(
            '${weatherModel!.temperature.toString()}°',
            style: const TextStyle(fontSize: 22),
          ),

          const SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  // wind speed
                  Text(
                    'Wind   ${weatherModel!.windSpeed.toString()}kph',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Feels Like   ${weatherModel!.feelsLike.toString()}°',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Column(
                children: [
                  // precip
                  Text(
                    'Precip   ${weatherModel!.precip.toString()}%',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'UV Index   ${weatherModel!.uv.toString()}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
