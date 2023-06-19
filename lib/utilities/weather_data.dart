import 'package:flutter/material.dart';

class WeatherData {
  final double temperature;
  final String weatherDescription;

  WeatherData({required this.temperature, required this.weatherDescription});
}

class WeatherWidget extends StatelessWidget {
  final WeatherData weatherData;

  const WeatherWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${weatherData.temperature}°C',
          style: const TextStyle(fontSize: 24),
        ),
        Text(
          weatherData.weatherDescription,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
