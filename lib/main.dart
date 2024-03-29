import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromRGBO(240, 240, 240, 1.0),
        textTheme:
            TextTheme(headlineLarge: GoogleFonts.oswald(color: Colors.black)),
      ),
      initialRoute: WeatherScreen.routeName,
      routes: {
        WeatherScreen.routeName: (context) => const WeatherScreen(),
      },
    );
  }
}
