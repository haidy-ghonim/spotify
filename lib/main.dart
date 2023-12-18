import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/sign/signin.dart';
import 'package:spotify/sign/signup.dart';
import 'package:spotify/splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  static const String KEYSignIn = "SignIn";
  @override
  void initState(){
    super.initState();
  //   whereToGo();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.splash,
      routes: {
        SplashScreen.splash: (context) => const SplashScreen(),
        SignIn.signin: (context) => const SignIn(),
        SignUp.signup: (context) => const SignUp(),
      },
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isKEYSignIn = sharedPref.getBool(KEYSignIn);
    Timer(const Duration(seconds: 2),(){
      if (isKEYSignIn!=null) {
        if (isKEYSignIn) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const SignIn(),));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SignUp(),));
        }
        }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const SignUp(),));
      }
    },
    );
  }
}



