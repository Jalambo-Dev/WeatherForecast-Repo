import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[200],
        child: ListView(
          children: [
            // Logo app
            const SizedBox(
              height: 150,
              child: DrawerHeader(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_circle,
                        color: Colors.blue,
                        size: 60,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      // logo
                      Text(
                        'WeatherForecast',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Home tap
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
              subtitle: const Text('Current Location'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () => Navigator.pushNamed(context, '/home_screen'),
            ),

            const Divider(
              endIndent: 20,
              indent: 20,
            ),
            // Hourly tap
            ListTile(
              leading: const Icon(
                Icons.access_time,
                color: Colors.blue,
              ),
              title: const Text(
                'Hourly Forecast',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
              subtitle: const Text('24 - Hours Forecast'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () => Navigator.pushNamed(context, '/hourly_screen'),
            ),
            const Divider(
              endIndent: 20,
              indent: 20,
            ),

            // Daily tap
            ListTile(
              leading: const Icon(
                Icons.calendar_month,
                color: Colors.blue,
              ),
              title: const Text(
                'Daily Forecast',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
              subtitle: const Text('3 - Days Forecast'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () => Navigator.pushNamed(context, '/daily_screen'),
            ),
            const Divider(
              endIndent: 20,
              indent: 20,
            ),

            // Cities tap
            ListTile(
              leading: const Icon(
                Icons.location_city,
                color: Colors.blue,
              ),
              title: const Text(
                'Cities',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
              subtitle: const Text('14 - Cities Forecast'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () => Navigator.pushNamed(context, '/cities_screen'),
            ),
          ],
        ),
      ),
    );
  }
}
