import 'package:flutter/material.dart';
import 'package:weatherapp/models/location_model.dart';
import 'package:weatherapp/screens/home_screen.dart';
import 'package:weatherapp/widgets/location_box_widget.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<CityProperty> locations = [
    CityProperty(name: 'Lagos',latitude: 6.5234965132805565,longitude: 3.384553116052763),
    CityProperty(name: 'London, UK',latitude: 51.51252741129245,longitude: -0.11501615976209004),
    CityProperty(name: 'Uyo', latitude: 4.98786663986766, longitude: 7.9832866719122295),
    CityProperty(name: 'Osogbo',latitude: 7.78242224917208,longitude: 4.542785497655228),
    CityProperty(name: 'Erin Osun',latitude: 7.823990689205104,longitude: 4.487784437565891),
    CityProperty(name: 'Akure',latitude: 7.257608786511467,longitude: 5.209575393071059),
    CityProperty(name: 'Benin City',latitude: 6.336183722790348,longitude: 5.611616304526106),
    CityProperty(name: 'Warri',latitude: 5.5506200502566765,longitude: 5.769340095367439),
    CityProperty(name: 'Jos', latitude: 9.934152087732585, longitude: 8.852009136632542),
    CityProperty(name: 'Enugu',latitude: 6.468893651115182,longitude: 7.521491152955105),
    CityProperty(name: 'Owerri',latitude: 5.695697233625212,longitude: 7.162233084769832),
  ];

  List<CityProperty> foundLocations = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      foundLocations = locations;
    });
  }

  void addCityProperty(index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(location: locations[index]),
      ),
    );
  }

  onSearch(String search) {
    setState(() {
      foundLocations = locations
          .where((location) => location.name.contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white24,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 30,
                    child: Image.asset(
                      'assets/icons/search.png',
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    onChanged: (value) => onSearch(value),
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Search location in Capital letter'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: foundLocations.length,
          itemBuilder: (context, index) {
            return LocationBoxWidget(
              child: ListTile(
                onTap: () {
                  addCityProperty(index);
                },
                title: Text(foundLocations[index].name),
              ),
            );
          }),
    );
  }
}
