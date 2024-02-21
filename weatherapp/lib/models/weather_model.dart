class Weather {
  var sys;
  var main;
  var wind;
  var weather;
  var cloud;
  
  


  Weather({
      required this.main,
      required this.sys,
      required this.wind,
      required this.weather,
      required this.cloud
       
  });

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      sys: json['sys'] as Map<String, dynamic>,
      wind: json['wind'] as Map<String, dynamic>,
      weather: json['weather'],
      main: json['main'] as Map<String, dynamic>,
      cloud: json['clouds'] 
    );
  }

  

}

class CurrentWeather {
  CurrentWeather({required this.temp, required this.windSpeed, required this.humidity, required this.icon, required this.des});

  final double temp;
  final double windSpeed;
  final int humidity;
  final String icon;
  final String des;


}