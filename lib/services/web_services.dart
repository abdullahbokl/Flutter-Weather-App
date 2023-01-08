import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class weatherService {

  String baseURL = 'http://api.weatherapi.com/v1';
  String apiKey = 'f6957389021343e5a77145315230601';

  Future<WeatherModel?> getWeather({required String cityName}) async {

    WeatherModel? weather;

    try{
      Uri url = Uri.parse("${baseURL}/forecast.json?key=${apiKey}&q=${cityName}");
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
    }catch(e) {
      print(e);
    }

    return weather;
  }


}