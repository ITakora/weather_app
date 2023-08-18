import 'package:cuaca/riverpods/weather_riverpod.dart';
import 'package:cuaca/presentation/widgets/forecast_card_widget.dart';
import 'package:cuaca/presentation/widgets/weather_day_card.dart';
import 'package:cuaca/presentation/widgets/weather_info_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  String appbarTitle = '';
  String appbarSubTitle = '';
  Position? position;
  String getLatLong = '';
  bool isLoading = false;

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    // Test if location services are enabled.
    await Geolocator.isLocationServiceEnabled();

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    setState(() {
      isLoading = true;
    });
    final getPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemark = await placemarkFromCoordinates(
          getPosition.latitude, getPosition.longitude);
      Placemark place = placemark[0];
      setState(() {
        position = getPosition;
        appbarTitle = '${place.subAdministrativeArea}';
        appbarSubTitle = '${place.administrativeArea}, ${place.country}';
      });
      getLatLong = '${getPosition.latitude}, ${getPosition.longitude}';
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });

    return getPosition;
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(weatherProvider(getLatLong));
    final dateTime = DateTime.now();
    final String dateTimeNow = DateFormat('hh:mm a').format(dateTime);
    Widget lottie =
        Lottie.asset('assets/lottie/weather_animation.json', fit: BoxFit.cover);
    List<Color> gradient = const [
      Color(0xff29B2DD),
      Color(0xff33AADD),
      Color(0xff2DC8EA)
    ];

    if (dateTime.hour >= 17.00) {
      lottie =
          Lottie.asset('assets/lottie/weather_night.json', fit: BoxFit.cover);
      gradient = const [
        Color(0xff08244F),
        Color(0xff134CB5),
        Color(0xff0B42AB)
      ];
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 100,
            title: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: data.when(
                  data: (data) {
                    return ListTile(
                      leading: const Icon(
                        Icons.pin_drop,
                        color: Colors.white,
                        size: 30,
                      ),
                      title: Text(
                        data.location.name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        '${data.location.region},${data.location.country}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: Text(
                        dateTimeNow,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  error: (error, stackTrace) => Container(
                    color: Colors.transparent,
                  ),
                  loading: () => Container(
                    color: Colors.transparent,
                  ),
                )),
          ),
          body: data.when(
            error: (error, stackTrace) => getLatLong.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Center(
                    child: Text(error.toString()),
                  )),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            data: (data) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, top: 8),
                        child: SizedBox(
                          width: 180,
                          height: 180,
                          child: lottie,
                        ),
                      ),
                    ),
                    Center(
                        child: Column(
                      children: [
                        Text(
                          data.current.condition.text,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${data.current.tempC} C ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    )),
                    const SizedBox(height: 20),
                    WeatherInfo(
                      data: data.forecast.forecastday,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    WeatherDay(
                      data: data.forecast.forecastday,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ForecastWidget(
                      data: data.forecast.forecastday,
                    ),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
