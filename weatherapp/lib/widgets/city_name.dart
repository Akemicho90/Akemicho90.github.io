import 'package:flutter/material.dart';
import 'package:weatherapp/screens/home_screen.dart';



class CityName extends StatelessWidget {
  const CityName({
    super.key,
    required this.widget,
  });

  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.topLeft,
      child: Text(
        widget.location.name,
        style: const TextStyle(
          fontSize: 35,
          color: Colors.black,
          height: 2,
        ),
      ),
    );
  }
}