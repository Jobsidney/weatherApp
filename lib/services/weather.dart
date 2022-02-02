import 'package:climate_app/services/location.dart';
import 'package:geolocator/geolocator.dart';

import 'networking.dart';

const apiKey = '996ab4186a492e9d6258bec0b099d91c';
var numberFutureDays = 7;

class WeatherModel {
  Future getCityWeather(var cityName) async {
    var url =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    NetworkingHelper networkingHelper = NetworkingHelper(url);
    var weatherData = await networkingHelper.getData();
    return weatherData;
  }

  Future getFutureDayForecast() async {
    LocationPermission permission = await Geolocator.requestPermission();
    LocationPermission.always;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    latitude = position.latitude;
    longitude = position.longitude;
    var url =
        'http://api.openweathermap.org/data/2.5/forecast/daily?lat=$latitude&lon=$longitude&exclude=current,minutely,hourly,alerts&appid=$apiKey';
    NetworkingHelper networkingHelperFuture = NetworkingHelper(url);
    var futureWeatherData = await networkingHelperFuture.getData();
    print(futureWeatherData);
    return futureWeatherData;
  }

  double? latitude;
  double? longitude;
  Future getLocationWeather() async {
    LocationPermission permission = await Geolocator.requestPermission();
    LocationPermission.always;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    latitude = position.latitude;
    longitude = position.longitude;
    NetworkingHelper networkingHelper = NetworkingHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await networkingHelper.getData();

    return weatherData;
  }

  Future getLocationForecast() async {
    Location location = Location();
    location.getCurrentLocation();
    NetworkingHelper networkingFore = NetworkingHelper(
        'http://api.openweathermap.org/data/2.5/forecast/daily?lat=${location.latitude}&lon=${location.longitude}&cnt=7&appid=$apiKey&units=metric');
    var foreCastWeather = await networkingFore.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '⛈️';
    } else if (condition < 400) {
      return '🌧️ ';
    } else if (condition < 600) {
      return '🌦️';
    } else if (condition < 700) {
      return '❄️';
    } else if (condition < 800) {
      return '🌫️';
    } else if (condition < 805) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time in ';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in ';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in ';
    } else {
      return 'Bring a 🧥 just in case in ';
    }
  }
}
