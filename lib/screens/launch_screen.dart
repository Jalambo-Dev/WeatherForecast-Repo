import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, '/home_screen'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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

            SizedBox(
              height: 50,
            ),

            // creator by Ahmed Marwan Omer Jalambo

            Text(
              'GitHub: Jalambo-Dev',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
