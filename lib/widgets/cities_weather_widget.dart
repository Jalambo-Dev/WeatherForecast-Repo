import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_forecast_app_flutter/models/weather_model.dart';
import 'package:weather_forecast_app_flutter/screens/city_info_screen.dart';
import 'package:weather_forecast_app_flutter/services/weather_service.dart';

class CitiesWeatherWidget extends StatelessWidget {
  const CitiesWeatherWidget({
    super.key,
    required this.weatherModels,
  });

  final List<WeatherModel>? weatherModels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Icon(Icons.location_city),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '14 - Cities Forecast',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
            if (weatherModels != null)
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: weatherModels!.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.grey,
                  endIndent: 20,
                  indent: 20,
                ),
                itemBuilder: (context, index) {
                  final weatherModel = weatherModels![index];
                  return ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CityInfoScreen(weatherModel: weatherModel),
                          )),
                      // condition icon
                      leading: Lottie.asset(
                        WeatherService()
                            .getWeatherAnimation(weatherModel.condition),
                      ),
                      title: Center(
                        child: Text(
                          weatherModel.cityName,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // condition text
                          Text(
                            weatherModel.condition,
                          ),

                          const SizedBox(
                            width: 20,
                          ),

                          Text(
                            '${weatherModel.temperature}°',
                          ),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      ));
                },
              )
            else
              const Center(child: Text('No weather data available')),
          ],
        ),
      ),
    );
  }
}
