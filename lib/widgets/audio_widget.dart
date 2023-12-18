import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class AudioWidgetEx extends StatefulWidget {
  final String fileName;
  const AudioWidgetEx(this.fileName,{super.key});
  @override
  State<AudioWidgetEx> createState() => _AudioWidgetExState();
}

class _AudioWidgetExState extends State<AudioWidgetEx> {
  bool isPlaying = false;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    assetsAudioPlayer.open(
      Playlist(audios: [
        Audio("sounds/${widget.fileName}.mp3"),
      ]),
      autoStart: false,
    );
    audiListenerTrigger();
    super.initState();
  }

// if (event ==true) ==if (event)
// if (event ==false) ==if (!event)

  void audiListenerTrigger() {
    assetsAudioPlayer.playlistAudioFinished.listen((event) {
      if (event) {
        isPlaying = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
       tileColor: Colors.blue[200],
       title: const Text('sample 1'),
       trailing: IconButton(
        onPressed: () {
          if (assetsAudioPlayer.isPlaying.value) {
            assetsAudioPlayer.pause();
          } else {
            assetsAudioPlayer.play();
          }
          setState(() {
            isPlaying = !isPlaying;
          });
        },
        icon:
        (isPlaying) ? Icon(Icons.pause) : Icon(Icons.play_arrow)),
  ),
);












  }
}

