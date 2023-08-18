import 'package:cuaca/data/models/code_model.dart';

class Hour {
  int timeEpoch;
  DateTime time;
  double tempC;
  double tempF;
  int isDay;
  Condition condition;

  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: json["time_epoch"],
        time: DateTime.parse(json["time"]),
        tempC: json["temp_c"]?.toDouble(),
        tempF: json["temp_f"]?.toDouble(),
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
      );

  Map<String, dynamic> toJson() => {
        "time_epoch": timeEpoch,
        "time": time,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toJson(),
      };
}
