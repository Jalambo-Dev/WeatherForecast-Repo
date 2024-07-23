import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_forecast_app_flutter/models/weather_model.dart';
import 'package:weather_forecast_app_flutter/services/weather_service.dart';

class DaysListWidget extends StatelessWidget {
  const DaysListWidget({
    super.key,
    required this.currentCityWeather,
  });

  final WeatherModel? currentCityWeather;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Icon(Icons.calendar_month),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '3 - Days Forecast',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            separatorBuilder: (context, index) => const Divider(
              height: 20,
              thickness: 1,
              color: Colors.grey,
              endIndent: 20,
              indent: 20,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                // condition icon
                leading: Lottie.asset(
                  WeatherService().getWeatherAnimation(
                      (currentCityWeather!.dailyConditons[index])),
                ),
                title: Text(
                  '${currentCityWeather?.dailyConditons[index]}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // max tempreture
                    const Icon(Icons.keyboard_arrow_up_sharp),
                    Text(
                      '${currentCityWeather?.dailyMaxTemperatures[index]}°',
                    ),

                    // min temperture
                    const Icon(Icons.keyboard_arrow_down_sharp),
                    Text(
                      '${currentCityWeather?.dailyMinTemperatures[index]}°',
                    ),
                  ],
                ),

                // date
                trailing: Text(currentCityWeather!.dailyDate[index].toString()),
              );
            },
          ),
        ],
      ),
    );
  }
}
