import 'package:cuaca/data/api/weather_api.dart';

import 'package:cuaca/data/models/weather_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherProvider = FutureProvider.family<WeatherModel, String>(
    (ref, location) => ref.read(weatherApi).getApi(location));
