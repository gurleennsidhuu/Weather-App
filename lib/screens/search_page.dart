import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_weather_app/constants/constants.dart';
import 'package:my_weather_app/constants/footer.dart';
import '../network/weather.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';

const apiKey = '6380132af3886d2895eaed0fbe67b15d';

class SearchPage extends StatefulWidget {
  final cityName;

  const SearchPage(this.cityName);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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

  getData() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=${widget.cityName}&appid=$apiKey&units=metric'),
    );
    setState(() {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        temp = decodedData['main']['temp'].toInt().toString();
        icon = decodedData['weather'][0]['icon'];
        humidity = decodedData['main']['humidity'].toString();
        weatherDes = decodedData['weather'][0]['description'];
        city = decodedData['name'];
        wind = decodedData['wind']['speed'].toString();
      }
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
