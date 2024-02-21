import 'package:weatherapp/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class OptionBox extends StatelessWidget {
  final text;
  final image;
  const OptionBox({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: BoxWidget(
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: image,
              ),
              const SizedBox(
                width: 60,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text('$text'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
