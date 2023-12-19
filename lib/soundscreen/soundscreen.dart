//awal wa7da 3amatahaa

import 'package:flutter/material.dart';
import 'package:spotify/widgets/audio_widget.dart';

class SoundScreen extends StatelessWidget {
  const SoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true),
      home: const MyScreenPage(
        title: 'Spotify App',
      ),
    );
  }
}

class MyScreenPage extends StatefulWidget {
  const MyScreenPage({super.key, required this.title});
  final String title;

  @override
  State<MyScreenPage> createState() => _MyScreenPageState();
}

class _MyScreenPageState extends State<MyScreenPage> {
  //batsama 3alsha ya3eyab type of list
  var fileNames = [
    "city-lights",
    "leaving-earth",
    "sands-of-alba",
    "tomorrow",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer:   const Drawer(
      // key: IconButton(onPressed: (){
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const DashPge()));
      // }, icon: Icon(Icons.menu)),
      // ),

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Icon(Icons.multitrack_audio),
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              onPressed: () => {}, icon:  const Icon(Icons.favorite_sharp)),
          IconButton(
              onPressed: () {}, icon:  const Icon(Icons.notification_add_sharp)),
        ],
      ),
      body: ListView.builder(
        itemCount: fileNames.length,
        itemBuilder: (context, index) {
          return HomePage(fileNames[index],);
        },
      ),
    );}}