import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherModel {
  DateTime? date;
  double? maxTemp;
  double? minTemp;
  double? avgTemp;
  String? weatherState;

  WeatherModel(
      {required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.avgTemp,
      required this.weatherState});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        // date: data['location']['localtime'],

        date: DateFormat("dd-MM-yyyy H:m").parse(data['location']['localtime']),
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        avgTemp: jsonData['avgtemp_c'],
        weatherState: jsonData['condition']['text']);
  }

  getImage() {
    switch (weatherState) {
      case 'clear':
        return 'assets/images/clear.png';
      case 'cloudy':
      case 'Partly cloudy':
        return 'assets/images/cloudy.png';
      case 'rainy':
      case 'Moderate rain':
        return 'assets/images/rainy.png';
      case 'snow':
        return 'assets/images/snow.png';
      case 'snow':
        return 'assets/images/snow.png';
      case 'thunderstorm':
        return 'assets/images/thunderstorm.png';
      default:
        return 'assets/images/thunderstorm.png';
    }
  }

  MaterialColor getColor() {
    switch (weatherState) {
      case 'Clear':
      case 'Sunny':
      case 'Light cloudy':
        return Colors.orange;
      case 'Cloudy':
      case 'Partly cloudy':
      case 'Heavy cloudy':
      case 'thunderstorm':
        return Colors.blueGrey;
      case 'Rainy':
      case 'Moderate rain':
        return Colors.blue;
      case 'snow':
      case 'Sleet':
      case 'Hall':
        return Colors.blue;
      default:
        return Colors.blue;
    }
  }

  @override
  String toString() {
    return 'date = ${date}, avgTemp = ${avgTemp}, maxTemp = ${maxTemp}, minTemp = ${minTemp}, weatherState = ${weatherState}';
  }
}
