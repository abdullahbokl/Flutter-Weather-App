import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/web_services.dart';

class SearchPage extends StatelessWidget {

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            onChanged: (value) {
              cityName = value;
            },
            onSubmitted: (value) async {
              cityName = value;
               WeatherModel? weather = await weatherService().getWeather(cityName: cityName!);

               Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
               Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;

               Navigator.of(context).pop();

            },
            style: TextStyle(
              fontSize: 18,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 35),
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () async{
                  WeatherModel? weather = await weatherService().getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
