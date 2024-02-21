import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/widgets/decision_box_widget.dart';
import 'package:weatherapp/widgets/box_widget.dart';
import 'package:weatherapp/widgets/option_box_widget.dart';

class WeatherData extends StatefulWidget {
  const WeatherData({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  State<WeatherData> createState() => _WeatherDataState();
}

class _WeatherDataState extends State<WeatherData> {
  bool isVisibleTemperature = false;
  bool isVisibleHumidity = false;
  bool isVisibleCloud = false;

  String getTime(int x) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(x * 1000);
    String f = DateFormat('jm').format(date);
    return f;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/weather/${widget.snapshot.data!.weather![0]['icon']}.png',
                height: 80,
                width: 80,
              ),
              const SizedBox(
                height: 50,
                width: 1,
              ),
              // Text('${widget.snapshot.data!.main['temp']} °C')
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: '${widget.snapshot.data!.main['temp'].round()}°C',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 68,
                        color: Colors.black,
                      )),
                  TextSpan(
                      text:
                          '${widget.snapshot.data!.weather[0]['description']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey,
                      )),
                ]),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BoxWidget(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset('assets/icons/windspeed.png'),
                  ),
                ),
                BoxWidget(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset('assets/icons/clouds.png'),
                  ),
                ),
                BoxWidget(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset('assets/icons/humidity.png'),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 20,
                  width: 60,
                  child: Text(
                    '${widget.snapshot.data!.wind['speed']} Km/h',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 60,
                  child: Text(
                    '${widget.snapshot.data!.cloud['all']}%',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 60,
                  child: Text(
                    '${widget.snapshot.data!.main['humidity']}%',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Decision',
          style: TextStyle(fontSize: 30, height: 2, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DecisionBox(
              image: Image.asset('assets/icons/thermometer.png'),
              text: 'Temperature',
              iconButton: IconButton(
                onPressed: () {
                  setState(() {
                    isVisibleTemperature = !isVisibleTemperature;
                  });
                },
                icon: const Icon(Icons.arrow_drop_down_sharp),
              ),
            ),
            Visibility(
              key: UniqueKey(),
              visible: isVisibleTemperature,
              child: Column(
                children: [
                  OptionBox(
                    text: widget.snapshot.data!.main['temp'] > 25
                        ? 'You may choose lighter and breathable clothing.'
                        : 'You may need to wear layers, jackets, hats, and gloves.',
                    image: Image.asset('assets/icons/shirt.png'),
                  ),
                  OptionBox(
                    text: widget.snapshot.data!.main['temp'] > 25
                        ? 'You may choose to go swimming or have a picnic.'
                        : 'Take a natural wake or Enjoy a warm drink and tasty meal while experiencing the chilly weather.',
                    image: Image.asset('assets/icons/temperature-outside.png'),
                  ),
                  OptionBox(
                    text: widget.snapshot.data!.main['temp'] > 25
                        ? 'Try to prevent heatstroke or dehydration'
                        : 'Wear appropriate clothing and avoid prolonged exposure to prevent frostbite or hypothermia.',
                    image: Image.asset('assets/icons/doctorsbag.png'),
                  ),
                  OptionBox(
                    text: widget.snapshot.data!.main['temp'] > 25
                        ? 'It hot, you need to use more electricity to run fans or air conditioners.'
                        : 'It cold, you need to utilize a heating systems.',
                    image: Image.asset('assets/icons/renewableenergy.png'),
                  ),
                  OptionBox(
                    text: widget.snapshot.data!.main['temp'] > 25
                        ? 'Drink more chill water to avoid dehydration.'
                        : 'Drink a warm tea or coffee to keep you warm.',
                    image: Image.asset('assets/icons/sparklingwater.png'),
                  ),
                ],
              ),
            ),
            DecisionBox(
              image: Image.asset('assets/icons/humidity.png'),
              text: 'Humidity',
              iconButton: IconButton(
                onPressed: () {
                  setState(() {
                    isVisibleHumidity = !isVisibleHumidity;
                  });
                },
                icon: const Icon(Icons.arrow_drop_down_sharp),
              ),
            ),
            Visibility(
              key: UniqueKey(),
              visible: isVisibleHumidity,
              child: Column(
                children: [
                  OptionBox(
                    text: widget.snapshot.data!.main['temp'] > 25 &&
                            widget.snapshot.data!.main['humidity'] >= 60
                        ? 'You may choose lighter and breathable clothing.'
                        : 'You may need to wear layers, jackets, hats, and gloves.',
                    image: Image.asset('assets/icons/shirt.png'),
                  ),
                  OptionBox(
                    text: widget.snapshot.data!.main['humidity'] > 60
                        ? 'You may choose to go swimming or have a picnic.'
                        : 'Take a natural wake or Enjoy a warm drink and tasty meal while experiencing the chilly weather.',
                    image: Image.asset('assets/icons/temperature-outside.png'),
                  ),
                  OptionBox(
                    text: widget.snapshot.data!.main['humidity'] > 50
                        ? 'You may need to adjust their air conditioning settings or use dehumidifiers to remove excess moisture from the air and maintain a comfortable indoor environment.'
                        : 'It is more comfortable.',
                    image: Image.asset('assets/icons/airconditioner.png'),
                  ),
                  OptionBox(
                    text: widget.snapshot.data!.main['humidity'] > 25
                        ? 'It hot, you need to use more electricity to run fans or air conditioners.'
                        : 'It cold, you need to utilize a heating systems.',
                    image: Image.asset('assets/icons/renewableenergy.png'),
                  ),
                  OptionBox(
                    text: widget.snapshot.data!.main['humidity'] > 60 
                        ? 'Maintain a good hygiene routine.'
                        : 'Is good fo the hair and skin.',
                    image: Image.asset('assets/icons/skin.png'),
                  ),
                ],
              ),
            ),
            DecisionBox(
              image: Image.asset('assets/icons/clouds.png'),
              text: 'Cloud',
              iconButton: IconButton(
                onPressed: () {
                  setState(() {
                    isVisibleCloud = !isVisibleCloud;
                  });
                },
                icon: const Icon(Icons.arrow_drop_down_sharp),
              ),
            ),
            Visibility(
              key: UniqueKey(),
              visible: isVisibleCloud,
              child: Column(
                children: [
                  OptionBox(
                    text: widget.snapshot.data!.main['temp'] > 25
                        ? 'You may choose lighter and breathable clothing.'
                        : 'You may need to wear layers, jackets, hats, and gloves.',
                    image: Image.asset('assets/icons/shirt.png'),
                  ),
                  OptionBox(
                    text: widget.snapshot.data!.main['temp'] > 25
                        ? 'You may choose to go swimming or have a picnic.'
                        : 'Take a natural wake or Enjoy a warm drink and tasty meal while experiencing the chilly weather.',
                    image: Image.asset('assets/icons/temperature-outside.png'),
                  ),
                  OptionBox(
                    text: widget.snapshot.data!.main['temp'] > 25
                        ? 'Try to prevent heatstroke or dehydration'
                        : 'Wear appropriate clothing and avoid prolonged exposure to prevent frostbite or hypothermia.',
                    image: Image.asset('assets/icons/doctorsbag.png'),
                  ),
                  OptionBox(
                    text: widget.snapshot.data!.main['temp'] > 25
                        ? 'It hot, you need to use more electricity to run fans or air conditioners.'
                        : 'It cold, you need to utilize a heating systems.',
                    image: Image.asset('assets/icons/renewableenergy.png'),
                  ),
                  OptionBox(
                    text: widget.snapshot.data!.main['temp'] > 25
                        ? 'Drink more chill water to avoid dehydration.'
                        : 'Drink a warm tea or coffee to keep you warm.',
                    image: Image.asset('assets/icons/sparklingwater.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BoxWidget(
              child: SizedBox(
                height: 160,
                width: 160,
                child: Column(
                  children: [
                    Image.asset('assets/icons/sunrise.png'),
                    const Text('sunrise'),
                    Text(getTime(widget.snapshot.data.sys['sunrise']))
                  ],
                ),
              ),
            ),
            BoxWidget(
              child: SizedBox(
                height: 160,
                width: 160,
                child: Column(
                  children: [
                    Image.asset('assets/icons/sunset.png'),
                    const Text('sunset'),
                    Text(getTime(widget.snapshot.data.sys['sunset']))
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
