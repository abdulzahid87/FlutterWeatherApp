import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:know_weather/services/networking.dart';
import 'package:know_weather/services/weather.dart';

import 'location_screen.dart';
/*import 'package:http/http.dart' as http;
import 'package:know_weather/screens/location_screen.dart';
import 'package:know_weather/services/networking.dart';*/

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var lat;
  var long;
  late double latitude;
  late double longitude;
  void getLocationData() async {
   /* Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    print(position);
    latitude = position.latitude;
    longitude = position.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=cb7e780914e58b6bde4d0b0c0ff95b2f&units=metric");
    var weatherData = await networkHelper.getData();*/
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    // lat = weatherData['weather'][1]['main'];
    // print(lat);
    // long = weatherData['weather'][0]['main'];
    // print(long);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather:weatherData);
      }),
    );
    /* http.Response response =await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=cb7e780914e58b6bde4d0b0c0ff95b2f"));
    print(response.body);*/
    // lat=26.850000&lon=80.949997
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    // getLocationData();
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size : 100.0,
        ),
      ),
    );
  }
}
