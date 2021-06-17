import 'package:flutter/material.dart';
import 'package:my_weather_app/screens/current_location_weather.dart';
import 'screens/search_page.dart';
import 'screens/home_page.dart';
import 'screens/search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(),
      initialRoute: 'home_page',
      routes: {
        'home_page': (context) => HomePage(),
        'current_location': (context) => CurrentLocation(),
        'search_bar': (context) => SearchBar(),
      },
    );
  }
}
