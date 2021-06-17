import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_weather_app/constants/constants.dart';

const apiKey = '6380132af3886d2895eaed0fbe67b15d';
String temp = '0';
var icon = '01d';
String humidity = '0';
String weatherDes = '0';
String tempMin = '0';
String tempMax = '0';
String windSpeed = '0';

class ElaborateWeather extends StatefulWidget {
  final cityName;

  const ElaborateWeather({this.cityName});

  @override
  _ElaborateWeatherState createState() => _ElaborateWeatherState();
}

class _ElaborateWeatherState extends State<ElaborateWeather> {
  @override
  void initState() {
    getData(widget.cityName);
    super.initState();
  }

  getData(String cityName) async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric'),
    );
    setState(() {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        temp = decodedData['main']['temp'].toInt().toString();
        icon = decodedData['weather'][0]['icon'];
        humidity = decodedData['main']['humidity'].toString();
        weatherDes = decodedData['weather'][0]['description'];
        tempMax = decodedData['main']['temp_max'].toString();
        tempMin = decodedData['main']['temp_min'].toString();
        windSpeed = decodedData['wind']['speed'].toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          gradient: LinearGradient(
              colors: [Color(0xffADD8E6), Color(0xffF0FFFF)],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      height: 180,
      width: 260,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.cityName,
              style: kWeatherHeading,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  temp + "°",
                  style: kTemperature,
                ),
                Image.asset(
                  'assets/images/' + icon + '.png',
                  height: 100,
                  width: 100,
                ),
              ],
            ),
            Text(
              'Weather: $weatherDes',
              style: kElaborateTemp,
            ),
            Text(
              'Minimum Temperature: $tempMin°',
              style: kElaborateTemp,
            ),
            Text(
              'Maximum Temperature: $tempMax°',
              style: kElaborateTemp,
            ),
            Text(
              'Humidity: $humidity',
              style: kElaborateTemp,
            ),
            Text(
              'Wind Speed: $windSpeed',
              style: kElaborateTemp,
            ),
          ],
        ),
      ),
    );
  }
}
