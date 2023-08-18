import 'package:cuaca/data/models/forecast_day_model.dart';

class Forecast {
  List<ForecastDay> forecastday;

  Forecast({
    required this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: List<ForecastDay>.from(
            json["forecastday"].map((x) => ForecastDay.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forecastday": List<dynamic>.from(forecastday.map((x) => x.toJson())),
      };
}
