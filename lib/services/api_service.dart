import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class ApiService {
  final String apiKey = '6fe49650e98edcabbcea05edb4d5ec20';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(String city) async {
    final url = Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
