import 'package:cuaca/data/models/current_model.dart';
import 'package:cuaca/data/models/forecast_model.dart';
import 'package:cuaca/data/models/location_models.dart';

class WeatherModel {
  Location location;
  Current current;
  Forecast forecast;

  WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
        "forecast": forecast.toJson(),
      };
}
