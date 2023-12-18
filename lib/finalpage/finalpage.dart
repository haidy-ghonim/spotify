import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spotify/splashscreen/splashscreen.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(padding: const EdgeInsets.all(20),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 500,
                child:
                Lottie.network('https://lottie.host/f0a1968c-f4c4-4733-b2a0-7e331e9b5ae5/6O8aTaIjqW.json', fit:BoxFit.contain ,
                  width:350 ,
                  height: 350,
                ),),
              const Text("Good Bye ... Haidy",
                style:TextStyle(fontWeight:FontWeight.bold,fontSize:20) ,),
              const SizedBox(height: 10,) ,
              const SizedBox(height: 15,),
              ActionChip(label: const Text("LOGOUT"),onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const SplashScreen()));
              }),
            ],
          ) ,
        ),
      ),
    );
  }
}
