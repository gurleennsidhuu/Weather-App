import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kGreeting =
    TextStyle(fontFamily: 'Roboto', fontSize: 35, fontWeight: FontWeight.bold);
const kDate =
    TextStyle(fontFamily: 'Roboto', color: Colors.black26, fontSize: 15);
const kYourFavourite = TextStyle(
  fontSize: 23,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
);

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Morning';
  }
  if (hour < 17) {
    return 'Afternoon';
  }
  return 'Evening';
}

String currentDate() {
  DateTime date = DateTime.now();
  String day = DateFormat('d').format(date);
  String month = DateFormat('MMMM').format(date);
  String weekDay = DateFormat('EEEE').format(date);
  return "$day $month, $weekDay";
}

const kWeatherHeading = TextStyle(
  fontSize: 20,
  color: Colors.black38,
  fontFamily: 'Roboto',
);

const kTemperature = TextStyle(
  fontSize: 60,
  fontFamily: 'Roboto',
);

const kElaborateTemp =
    TextStyle(color: Colors.black, fontFamily: 'Roboto', fontSize: 15);

const kFieldDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  hintText: 'Enter your email',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);
