import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_weather_app/constants/constants.dart';

const apiKey = '6380132af3886d2895eaed0fbe67b15d';
String temp = '0';
var icon = '01d';

class FrequentlySearchedWeather extends StatefulWidget {
  final cityName;

  const FrequentlySearchedWeather({this.cityName});

  @override
  _FrequentlySearchedWeatherState createState() =>
      _FrequentlySearchedWeatherState();
}

class _FrequentlySearchedWeatherState extends State<FrequentlySearchedWeather> {
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
      height: 163,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.cityName,
            style: kWeatherHeading,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                temp + "°",
                style: kTemperature.copyWith(fontSize: 70),
              ),
              Image.asset(
                'assets/images/' + icon + '.png',
                height: 100,
                width: 130,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
