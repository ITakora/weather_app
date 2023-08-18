import 'package:cuaca/data/models/code_model.dart';

class Current {
  int lastUpdatedEpoch;

  double tempC;
  int isDay;
  Condition condition;
  double windMph;
  double windKph;
  int cloud;
  double feelslikeC;
  double uv;

  Current({
    required this.lastUpdatedEpoch,
    required this.tempC,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.cloud,
    required this.feelslikeC,
    required this.uv,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        tempC: json["temp_c"],
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"],
        windKph: json["wind_kph"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"],
        uv: json["uv"],
      );

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "temp_c": tempC,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "uv": uv,
      };
}
