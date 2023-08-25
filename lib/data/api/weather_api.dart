import 'dart:convert';

import 'package:cuaca/data/models/weather_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherModel> getApi(String location) async {
    try {
      final Uri url = Uri.parse(
          'https://api.weatherapi.com/v1/forecast.json?key=a85701f9571843d18fa152930233107&q=$location&days=6');

      final respone = await http.get(url);
      final Map<String, dynamic> data = (jsonDecode(respone.body));
      final dataApi = WeatherModel.fromJson(data);
      return dataApi;
    } catch (e) {}

    return getApi(location);
  }
}

final weatherApi = Provider<WeatherApi>((ref) => WeatherApi());
