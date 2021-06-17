import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_weather_app/weather_cards/elaborate_weather_card.dart';
import 'package:my_weather_app/weather_cards/frequently_searched_weather.dart';
import '../constants/constants.dart';
import '../constants/footer.dart';

List<String> frequentlySearched = [
  'Los Angeles',
  'Birmingham',
  'Dubai',
  'Malaysia',
  'Delhi'
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good',
                        style: kGreeting,
                      ),
                      Text(
                        greeting(),
                        style: kGreeting,
                      ),
                    ],
                  ),
                  Image.asset('assets/images/app_icon.png', height: 60),
                ],
              ),
              Text(
                currentDate(),
                style: kDate,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElaborateWeather(cityName: 'New York'),
                    ElaborateWeather(cityName: 'Toronto'),
                  ],
                ),
              ),
              Text(
                'Frequently Searched',
                style: kYourFavourite,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FrequentlySearchedWeather(
                      cityName: 'Los Angeles',
                    ),
                    FrequentlySearchedWeather(
                      cityName: 'Birmingham',
                    ),
                    FrequentlySearchedWeather(
                      cityName: 'Dubai',
                    ),
                    FrequentlySearchedWeather(
                      cityName: 'Malaysia',
                    ),
                    FrequentlySearchedWeather(
                      cityName: 'Delhi',
                    ),
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
