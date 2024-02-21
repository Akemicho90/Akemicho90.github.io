import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherapp/api/fetch_weather.dart';
import 'package:weatherapp/models/location_model.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/widgets/date_time.dart';
import 'package:weatherapp/widgets/city_name.dart';
import 'package:weatherapp/widgets/weather_widget.dart';
import '../models/weather_model.dart';

class HomeScreen extends StatefulWidget {
  final CityProperty location;

  const HomeScreen({super.key, required this.location});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String dateTime = DateFormat('yyyy-MM-dd').format(DateTime.now());

  late Future<Weather> getWeather;
  @override
  void initState() {
    super.initState();
    getWeather = WeatherApiClient()
        .fetchWeather(widget.location.latitude, widget.location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title:  const Text("W E A T H E R"),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              if (Platform.isAndroid || Platform.isIOS){
                SystemNavigator.pop();
              } 
          }, 
          icon: const Icon(Icons.logout_rounded)
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 10,
            ),
            CityName(widget: widget),
            DateTimer(dateTime: dateTime),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
            child: FutureBuilder(
              future: getWeather,
              builder: (context, snapshot){
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }else if (snapshot.hasData) {
                  return WeatherData(snapshot: snapshot,);
                }else{
                  return const Center(child: CircularProgressIndicator(),);
                }
              }
            )
            ,),
          ],
        ),
      ),
    );
  }
}



