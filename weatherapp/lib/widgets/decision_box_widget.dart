import 'package:weatherapp/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class DecisionBox extends StatelessWidget {
  final text;
  final image;
  final iconButton;
  const DecisionBox({
    super.key,required this.text,required this.image, this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: BoxWidget(
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: image,
              ),
              Text('$text'),
              iconButton,
            ],
          ),
        ),
      ),
    );
  }
}