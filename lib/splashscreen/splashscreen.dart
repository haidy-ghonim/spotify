import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spotify/sign/signin.dart';

class SplashScreen extends StatefulWidget {
  static const String splash = "splashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context,SignIn.signin);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Center(
            child: Lottie.network('https://lottie.host/da4704eb-2952-4f39-baf8-00889771de2a/5oNUNROwHQ.json',
              width:350 ,
              height: 350,
            ),),
        ),
      ),
    );
  }
}