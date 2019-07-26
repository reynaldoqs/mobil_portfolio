import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class VideoBgPositioned extends StatefulWidget {
  @override
  _VideoBgPositionedState createState() => _VideoBgPositionedState();
}

class _VideoBgPositionedState extends State<VideoBgPositioned> {
  VideoPlayerController playerController;

  @override
  void initState(){
    super.initState();
    if(playerController == null){
      playerController = VideoPlayerController.asset('assets/media/partyDark.mp4')
          ..setVolume(0.0)
          ..setLooping(true)
          ..initialize()
          ..play();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Positioned(
      top: -10,
      height: height*1.1,
      width: height*1.3,
      child: Container(
        child: (playerController != null ? VideoPlayer(playerController):Text('Problemas con el video...')),
      ),
    );
  }
}
