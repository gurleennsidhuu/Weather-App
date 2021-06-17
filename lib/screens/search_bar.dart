import 'package:flutter/material.dart';
import 'package:my_weather_app/constants/constants.dart';
import 'package:my_weather_app/screens/search_page.dart';

String? city;

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/giphy.gif'),
              fit: BoxFit.fill,
            ),
            gradient: LinearGradient(colors: [
              Color(0xff4169E1),
              Color(0xff3154A7),
              Colors.blueAccent,
              Colors.lightBlue,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  city = value;
                },
                decoration:
                    kFieldDecoration.copyWith(hintText: 'Enter the location.'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(city),
                    ),
                  );
                },
                child: Text('Search'),
                style: TextButton.styleFrom(backgroundColor: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
