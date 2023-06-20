import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:clima_flutter_weather_app/utilities/weather_data.dart';
import 'package:clima_flutter_weather_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:clima_flutter_weather_app/services/networking.dart';

const apiKey = '40349dc0801f59bdef8c06579fbb964a';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }

  void getData() async {
    const apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=$apiKey';
    final response = await http.get(Uri.parse(apiUrl));

    // Response response = await get(
    //     'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$latitude&appid=cacfefb9b486fea21a063f79e5c9ebc6'
    //         as Uri);

    if (response.statusCode == 200) {
      // final weatherJson = json.decode(response.body);
      // final weatherData = WeatherData(
      //   temperature: weatherJson['main']['temp'],
      //   condition: weatherJson['weather'][0]['id'],
      //   cityName: weatherJson['name'],
      //   weatherDescription: '',
      // );

      // print(weatherData);

      String body = response.body;
      var decodedData = jsonDecode(body);
      double temparature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];

      print(temparature);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
