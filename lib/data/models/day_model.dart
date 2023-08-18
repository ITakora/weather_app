import 'package:cuaca/data/models/code_model.dart';

class Day {
  double maxtempC;
  double mintempC;
  double avgtempC;
  double maxwindKph;
  int dailyWillItRain;
  int dailyChanceOfRain;
  int dailyWillItSnow;
  int dailyChanceOfSnow;
  Condition condition;
  double uv;

  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.avgtempC,
    required this.maxwindKph,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: json["maxtemp_c"]?.toDouble(),
        mintempC: json["mintemp_c"]?.toDouble(),
        maxwindKph: json["maxwind_kph"]?.toDouble(),
        avgtempC: json["avgtemp_c"],
        dailyWillItRain: json["daily_will_it_rain"],
        dailyChanceOfRain: json["daily_chance_of_rain"],
        dailyWillItSnow: json["daily_will_it_snow"],
        dailyChanceOfSnow: json["daily_chance_of_snow"],
        condition: Condition.fromJson(json["condition"]),
        uv: json["uv"],
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC,
        "mintemp_c": mintempC,
        "avgtemp_c": avgtempC,
        "maxwind_kph": maxwindKph,
        "daily_will_it_rain": dailyWillItRain,
        "daily_chance_of_rain": dailyChanceOfRain,
        "daily_will_it_snow": dailyWillItSnow,
        "daily_chance_of_snow": dailyChanceOfSnow,
        "condition": condition.toJson(),
        "uv": uv,
      };
}
