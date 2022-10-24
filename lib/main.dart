import 'package:flutter/material.dart';
import 'package:weather_app/views/weather_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WeatherPage( location: 'ankara',),
        
      ),
    );
  }
}
