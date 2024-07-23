import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_forecast_app_flutter/models/weather_model.dart';
import 'package:weather_forecast_app_flutter/services/weather_service.dart';

class HoursListWidget extends StatelessWidget {
  const HoursListWidget({
    super.key,
    required this.currentCityWeather,
  });

  final WeatherModel? currentCityWeather;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '24 - Hours Forecast',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 24,
              separatorBuilder: (context, index) => const Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
                endIndent: 20,
                indent: 20,
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Lottie.asset(
                    WeatherService().getWeatherAnimation(
                        (currentCityWeather!.hourlyConditons[index])),
                  ),
                  title: Text(
                    "${currentCityWeather?.hourlyConditons[index]}",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    "${currentCityWeather?.hourlyTemperatures[index]}°",
                    textAlign: TextAlign.center,
                  ),
                  trailing: Text(index < 10 ? "0$index:00" : "$index:00"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
