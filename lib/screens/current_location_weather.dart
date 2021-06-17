import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_weather_app/constants/constants.dart';
import 'package:my_weather_app/constants/footer.dart';
import '../network/weather.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';

class CurrentLocation extends StatefulWidget {
  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  WeatherModel weatherModel = WeatherModel();
  String temp = '';
  String wind = '';
  String humidity = '';
  String weatherDes = '';
  String city = '';
  var icon = '01d';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var weather = await weatherModel.getLocationWeather();
    setState(() {
      temp = weather['main']['temp'].toInt().toString();
      wind = weather['wind']['speed'].toString();
      humidity = weather['main']['humidity'].toString();
      weatherDes = weather['weather'][0]['description'].toString();
      city = weather['name'];
      icon = weather['weather'][0]['icon'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff4169E1),
              Color(0xff3154A7),
              Colors.blueAccent,
              Colors.lightBlue,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                city,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Weather: $weatherDes',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontSize: 17,
                ),
              ),
              GradientText(
                text: '$temp°',
                gradientDirection: GradientDirection.ttb,
                colors: <Color>[
                  Colors.white,
                  Colors.blueAccent,
                ],
                style: TextStyle(fontSize: 150.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Wind',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        wind,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/$icon.png',
                    height: 250,
                    width: 250,
                  ),
                  Column(
                    children: [
                      Text(
                        'Humidity',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        humidity,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/rain.png'),
                  Image.asset('assets/images/storm.png'),
                  Text(
                    currentDate(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Image.asset('assets/images/sun.png'),
                  Image.asset('assets/images/wind.png'),
                ],
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
