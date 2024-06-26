import 'package:flutter/material.dart';
import 'package:weather/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "Uttar Pradesh";

  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();
    String temp = instance.temp;
    String hum = instance.humidity;
    String air_speed = instance.air_speed;
    String des = instance.description;
    String main = instance.main;
    String icon = instance.icon;

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "icon_value": icon,
        "city_value": city
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic>? search =
        ModalRoute.of(context)?.settings.arguments as Map?;
    if (search?.isNotEmpty ?? false) {
      city = search?['searchText'];
    }

    startApp(city);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 180,
                ),
                Image.asset(
                  "images/weather_logo.png",
                  height: 240,
                  width: 240,
                ),
                Text(
                  "Weather App",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Made by Ankit Yadav",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SpinKitWave(
                  color: Colors.white,
                  size: 50.0,
                ),
              ]),
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
