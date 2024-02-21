import 'package:flutter/material.dart';


class DateTimer extends StatelessWidget {
  const DateTimer({
    super.key,
    required this.dateTime,
  });

  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.topLeft,
      child: Text(
        dateTime,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.grey,
          height: 1.5,
        ),
      ),
    );
  }
}
