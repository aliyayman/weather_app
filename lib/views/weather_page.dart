import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_api_client.dart';
import 'package:weather_app/views/choose_location_page.dart';
import 'package:weather_app/widgets/additioal_information.dart';
import 'package:weather_app/widgets/currentWeather.dart';

class WeatherPage extends StatefulWidget {
  String location;
  WeatherPage({required this.location});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherApiClient weatherApiClient = WeatherApiClient();
  Weather? data;
  late String cityname;

  @override
  void initState() {
    super.initState();
    weatherApiClient.getCurrentWeather(widget.location);
  }

  Future<void> getData() async {
    data = await weatherApiClient.getCurrentWeather(widget.location);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      cityname = widget.location;
    });


  
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,

          // ignore: prefer_const_constructors
          title: Text(
            'Weather App',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: (() async {
              (await Navigator.push<String>(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChooseLocationPage())))!;
            }),
            icon: Icon(Icons.search),
            color: Colors.black,
          ),

          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  currentWeather(
                      Icons.sunny, "${data!.feels_like}", "${data!.cityName}"),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 20,
                  ),
                  // ignore: prefer_const_constructors
                  Text(
                    'Additional Information',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 20,
                  ),
                  additioanlInformation("${data!.wind}", "${data!.humidity}",
                      "${data!.pressure}", "${data!.feels_like}")
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Text("Veriler getirelemedi");
            }

            return Text("Veriler getirelemedi");
          },
        ));
  }
}
