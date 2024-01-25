import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class WeatherScreen extends StatefulWidget {
  static const routeName = '/weather';

  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? weatherText;

  @override
  void initState() {
    super.initState();
    getLocationAndWeather();
  }

  void getLocationAndWeather() async {
    Location location = Location();

    try {
      var userLocation = await location.getLocation();
      double latitude = userLocation.latitude!;
      double longitude = userLocation.longitude!;

      // Call the method to get weather using the obtained latitude and longitude
      getWeatherByLocation(latitude, longitude);
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  void getWeatherByLocation(double latitude, double longitude) async {
    final url =
        Uri.parse("https://api.weatherapi.com/v1/current.json?key=6c0c31ea8fed4f03973112757242401&"
            "q=$latitude,$longitude&aqi=no");

    final response = await http.get(url);

    setState(() {
      weatherText = json.decode(utf8.decode(response.bodyBytes))['current']
          ['condition']['text'];
      print(weatherText);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(right: 20, bottom: 50, left: 15),
        alignment: Alignment.bottomLeft,
        child: RichText(
          text: TextSpan(
            children: [
                    const TextSpan(
                      text: "It's\nfucking ",
                    ),
                    TextSpan(
                      text: weatherText ?? 'Loading...',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              fontSize: 80,
                              height: 1.1,
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: "\nNow.",
                    ),
                  ]
            ,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 80, height: 1.1, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
