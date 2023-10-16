import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather App',
      home: WeatherInfo(),
    );
  }
}

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({
    Key? key,
  }) : super(key: key);

  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  final String apiKey =
      'cdc2e78c8fe748ec87f172618231709'; // Replace with your API key
  final String apiUrl = 'https://api.weatherapi.com/v1/current.json';
  final String cityName = 'Hyderabad';
  Map<String, dynamic>? weatherData;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final response =
        await http.get(Uri.parse('$apiUrl?q=${cityName}&key=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      setState(() {
        weatherData = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Info'),
      ),
      body: Center(
        child: weatherData == null
            ? const CircularProgressIndicator()
            : WeatherDataDisplay(weatherData: weatherData!),
      ),
    );
  }
}

class WeatherDataDisplay extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const WeatherDataDisplay({Key? key, required this.weatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'City: ${weatherData['location']['name']}',
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent),
        ),
        const SizedBox(height: 10),
        Text(
          'Temperature: ${weatherData['current']['temp_c']}°C',
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent),
        ),
        const SizedBox(height: 10),
        Text(
          'Condition: ${weatherData['current']['condition']['text']}',
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent),
        ),
        const SizedBox(height: 10),
        if (weatherData['current']['is_day'] == 0)
          const Text(
            'Day/Night: Night',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent),
          ),
        if (weatherData['current']['is_day'] == 1)
          const Text(
            'Day/Night: Day',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent),
          ),
      ],
    );
  }
}
