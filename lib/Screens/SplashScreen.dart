import 'dart:async';
import 'package:flipkart/Screens/Dashboard.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Dashboard(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.blueAccent,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "lib/Assets/images/logo.png",
                width: 100,
                height: 100,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Created By Yash Chandra",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        ],
      ),
    );
  }
}
