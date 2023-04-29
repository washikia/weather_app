import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = "e65be22ab855b9258b2c4e36ba8d9eaa";
const String webAddr = "https://api.openweathermap.org/data/2.5/weather?";

class WeatherModel {

  Future<dynamic> getCityWeather(String city) async{
    print(city);
    NetworkHelper networkHelper = await NetworkHelper(
        url: "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric"
    );
    var weather = await networkHelper.getData();
    print(weather);
    return weather;
  }

  Future<dynamic> getLocationWeather() async{

    Location location = await Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = await NetworkHelper(
        url:
        "$webAddr&lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");

    var weather = await networkHelper.getData();
    return weather;
  }

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