import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';
import '../services/web_services.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? cityName;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            onChanged: (value) => cityName = value,
            onSubmitted: (value) {
              cityName = value;
              _getWeatherData(cityName, context);
            },
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () => _getWeatherData(cityName, context),
                icon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _getWeatherData(String? cityName, BuildContext context) {
    WeatherService().getWeather(cityName: cityName!).then((weather) {
      Provider.of<WeatherProvider>(context, listen: false).weatherData =
          weather;
      Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
      Navigator.of(context).pop();
    });
  }
}
