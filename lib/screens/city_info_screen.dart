import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_forecast_app_flutter/models/weather_model.dart';
import 'package:weather_forecast_app_flutter/services/weather_service.dart';

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            //  city name
            Text(
              weatherModel!.cityName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // country name
            Text(
              weatherModel!.countryName,
              style: const TextStyle(fontSize: 18),
            ),

            // condition icon
            Lottie.asset(
                WeatherService().getWeatherAnimation(weatherModel!.condition)),

            const SizedBox(
              height: 10,
            ),

            // condition text
            Column(
              children: [
                Text(
                  weatherModel!.condition,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  '${weatherModel!.temperature.toString()}°',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
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
            const Divider(
              height: 20,
              thickness: 1,
              color: Colors.blue,
              endIndent: 50,
              indent: 50,
            ),
            const SizedBox(
              height: 10,
            ),

            ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: 24,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
                endIndent: 20,
                indent: 20,
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Lottie.asset(WeatherService().getWeatherAnimation(
                      weatherModel!.hourlyConditons[index])),
                  title: Center(
                    child: Text(
                      "${weatherModel?.hourlyTemperatures[index]}°    ${weatherModel?.hourlyConditons[index]}",
                    ),
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
