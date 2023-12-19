import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String fileName;
  final int id;
  final int length;
  const HomePage(this.fileName, this.id, this.length, {super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPlaying = false;

  late AssetsAudioPlayer assetsAudioPlayer;

  @override
  void initState() {
    assetsAudioPlayer = AssetsAudioPlayer.withId(widget.id.toString());
    assetsAudioPlayer.open(
        Playlist(audios: [
          Audio("sounds/${widget.fileName}.mp3"),
        ]),
        autoStart: false);
    audiListenerTrigger();
    super.initState();
  }

// if (event ==true) ==if (event)
// if (event ==false) ==if (!event)

  void audiListenerTrigger() {
    assetsAudioPlayer.playlistAudioFinished.listen((event) {
      // if (event){} //TODO amaba3amalhaa betal3a error
      isPlaying = false;
      setState(() {});
    });
  } //audiListenerTrigger

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.blue[200],
        title: Text(widget.fileName),
        trailing: IconButton(
            onPressed: () {
              if (assetsAudioPlayer.isPlaying.value) {
                assetsAudioPlayer.pause();
              } else {
                // ama yamal play ywafa el bakaa w men el start and end
                for (var i = 0; i < widget.length; i++) {
                  var closedAssetAudioPlayer =
                      AssetsAudioPlayer.withId(i.toString());
                  if (closedAssetAudioPlayer.isPlaying.value) {
                    closedAssetAudioPlayer.stop();
                  }
                }
                //****
                assetsAudioPlayer.play();
              }
              setState(() {
                isPlaying = !isPlaying;
              });
            },
            icon: (isPlaying) ? Icon(Icons.pause) : Icon(Icons.play_arrow)),
      ),
    );
  }
}
