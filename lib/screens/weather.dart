import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  static const routeName = '/weather';

  const WeatherScreen({super.key});

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
                text: "\nRaining.",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 80,
                    height: 1.1,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text: "\nNow.",
              ),
            ],
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 80, height: 1.1, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
