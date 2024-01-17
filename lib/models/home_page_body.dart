import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';
import 'weather_model.dart';

class HomePageBody extends StatelessWidget {
  final WeatherModel weather;

  const HomePageBody({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildBoxDecoration(context),
      child: Column(
        children: [
          const Spacer(flex: 3),
          Text(
            Provider.of<WeatherProvider>(context).cityName!,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Updated at ${weather.date!.hour}:${weather.date!.minute}',
            style: const TextStyle(fontSize: 24),
          ),
          const Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weather.getImage()),
              Text(
                '${weather.avgTemp!.toInt()}',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text('${weather.maxTemp!.toInt()}'),
                  Text('${weather.minTemp!.toInt()}'),
                ],
              ),
            ],
          ),
          const Spacer(flex: 1),
          Text(
            weather.weatherState!,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Provider.of<WeatherProvider>(context).weatherData!.getColor(),
            Provider.of<WeatherProvider>(context).weatherData!.getColor()[300]!,
            Provider.of<WeatherProvider>(context).weatherData!.getColor()[100]!,
          ]),
    );
  }
}
