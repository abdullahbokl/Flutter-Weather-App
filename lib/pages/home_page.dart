import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData =
        Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: weatherData == null
          ? EmptyHomePage()
          : MainHomePage(
              weather: weatherData,
            ),
    );
  }
}

class EmptyHomePage extends StatelessWidget {
  const EmptyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}

class MainHomePage extends StatelessWidget {
  WeatherModel weather;

  MainHomePage({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Provider.of<WeatherProvider>(context).weatherData!.getColor(),
              Provider.of<WeatherProvider>(context)
                  .weatherData!
                  .getColor()[300]!,
              Provider.of<WeatherProvider>(context)
                  .weatherData!
                  .getColor()[100]!,
            ]),
      ),
      child: Column(
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            '${Provider.of<WeatherProvider>(context).cityName!}',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Updated at ${weather.date!.hour}:${weather.date!.minute}',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weather.getImage()),
              Text(
                '${weather.avgTemp!.toInt()}',
                style: TextStyle(
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
          const Spacer(
            flex: 1,
          ),
          Text(
            '${weather.weatherState!}',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
