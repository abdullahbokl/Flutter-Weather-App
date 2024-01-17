import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/home_page_body.dart';
import '../models/weather_model.dart';
import '../providers/weather_provider.dart';
import '../widgets/empty_widget.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    weatherData =
        Provider.of<WeatherProvider>(context, listen: true).weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: weatherData == null
          ? const EmptyWidget()
          : HomePageBody(weather: weatherData!),
    );
  }
}
