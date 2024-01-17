import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  final String baseURL = 'http://api.weatherapi.com/v1';
  final String apiKey = 'f6957389021343e5a77145315230601';

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;

    try {
      Uri url = Uri.parse("$baseURL/forecast.json?key=$apiKey&q=$cityName");
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
    } catch (e) {
      debugPrint(e.toString());
    }

    return weather;
  }
}
