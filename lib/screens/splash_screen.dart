import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_baro/screens/weather_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WeatherScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
      children: [
        SizedBox(height: 250,),
        Center(
          child: Text("Smart Baro",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
        ),
        SizedBox(height: 200,),
        Text(" Reserved by MPDAM1 ",
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),)
      ],
      ),
    );
  }
}
