import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'providers/weather_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (BuildContext context) => WeatherProvider(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch:
            Provider.of<WeatherProvider>(context).weatherData?.weatherState ==
                    null
                ? Colors.blue
                : Provider.of<WeatherProvider>(context).weatherData!.getColor(),
      ),
      home: const HomePage(),
    );
  }
}
