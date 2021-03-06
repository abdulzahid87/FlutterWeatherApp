
import 'package:know_weather/services/location.dart';
import 'package:know_weather/services/networking.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=cb7e780914e58b6bde4d0b0c0ff95b2f&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=cb7e780914e58b6bde4d0b0c0ff95b2f&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }


  // Future<dynamic> getCityWeather(String cityName) async{
  //   var url = "http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=cb7e780914e58b6bde4d0b0c0ff95b2f&units=metric";
  //   NetworkHelper networkHelper = NetworkHelper(url);
  //   var weatherData = await networkHelper.getData();
  //   return weatherData;
  // }

  //  Future<dynamic> getLocationWeather() async{
  //
  //     Location location = Location();
  //     await location.getCurrentLocation();
  //     /*await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
  //     print(position);
  //     latitude = position.latitude;
  //     longitude = position.longitude;*/
  //     NetworkHelper networkHelper = NetworkHelper(
  //         "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=cb7e780914e58b6bde4d0b0c0ff95b2f&units=metric");
  //     var weatherData = await networkHelper.getData();
  //     return weatherData;
  //
  // }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
  }