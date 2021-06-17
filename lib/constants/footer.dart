import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      //margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: Image.asset('assets/images/direction.png'),
            onTap: () {
              Navigator.pushNamed(context, 'current_location');
            },
          ),
          GestureDetector(
            child: Image.asset('assets/images/home.png'),
            onTap: () {
              Navigator.pushNamed(context, 'home_page');
            },
          ),
          GestureDetector(
            child: Image.asset('assets/images/loupe.png'),
            onTap: () {
              Navigator.pushNamed(context, 'search_bar');
            },
          ),
          Image.asset(
            'assets/images/app_icon.png',
            height: 32,
          ),
        ],
      ),
    );
  }
}
