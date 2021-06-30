//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:responsive_builder/responsive_builder.dart';
//import 'package:video_player/video_player.dart';
/*
class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  VideoPlayerController _videoPlayerController;
  bool _isPlaying = true;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset('videos/intro.mp4')..initialize()..setLooping(true)..play().then((value) {
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation){
        return Scaffold(
          body: Stack(
            children: <Widget>[
              _videoPlayerController.value.isInitialized
                  ?Container(
                child: InkWell(
                    onTap: (){
                      setState(() {
                        if(_videoPlayerController.value.isPlaying){
                          _isPlaying = false;
                          _videoPlayerController.pause();
                        }
                        else{
                          _isPlaying = true;
                          _videoPlayerController.play();
                        }
                      });
                    },
                    child: VideoPlayer(_videoPlayerController)
                ),
              )
                  :Container(),
              _isPlaying == false?Align(
                child: Container(
                  height: 20,
                  width: 20
                  ,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                  ),
                )
              ):Container(),
            ],
          ),
        );
      },
    );
  }
}
*/