import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

String apikey = "ee407b9190a6b601ece919ad22d75810";
String urlsamewords = "https://api.openweathermap.org/data/2.5/weather?";
Location location = Location();

class WeatherModel {
  Future getcityweather(String cityname) async {
    // this is for search city name api
    Networkhelper helper = Networkhelper(
        url: "${urlsamewords}q=$cityname&appid=$apikey&units=metric");
    // here await is use because we want ot wait until api is get
    dynamic data = await helper.getwatherdata();
    return data;
  }

  Future getweatherData() async {
    // here we have use getlocation because we want to wait until location is get otherwise app will be crashed
    await location.getlocation();
    Networkhelper helper = Networkhelper(
        // this is for live location api
        url:
            "${urlsamewords}lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric");
    // here is  calling of  api
    // here await is use because we want ot wait until api is get
    dynamic weather = await helper.getwatherdata();
    // here i am return jsondecode simpllary
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
