import 'package:flutter/material.dart';
import 'package:weather_app/screen/city_screen.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final weatherdata;
  const LocationScreen({super.key, required this.weatherdata});

  @override
  // ignore: library_private_types_in_public_api
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int? tempetrue;
  String? cityname;
  int? weather;

  @override
  void initState() {
    super.initState();
    // this because when app run by deafult data will come from previous screen
    updateUI(widget.weatherdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherdata = await weatherModel.getweatherData();
                      // this is because when we click button data will come from api
                      updateUI(weatherdata);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var textentered = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CityScreen()));
                      if (textentered != null) {
                        var weatherdata =
                            await weatherModel.getcityweather(textentered);
                        updateUI(weatherdata);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "${tempetrue.toString()}°",
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherModel.getWeatherIcon(weather!),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "${weatherModel.getMessage(tempetrue!)} in  $cityname",
                  textAlign: TextAlign.right,
                  maxLines: null,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // this function is use for uodate screen
  updateUI(dynamic weatherdata) async {
    if (weatherdata == null) {
      tempetrue = 0;
      cityname = "erro";
      weather = 0;
      return;
    }
    setState(() {
      double temp = weatherdata["main"]["temp"];
      tempetrue = temp.toInt();
      cityname = weatherdata["name"];
      weather = weatherdata['weather'][0]['id'];
    });
  }
}
