import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          height: 70.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "@angleQueen",
                style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white
              ),
              ),
              Text("Video title and some other stuff",
              style: TextStyle(
                color: Colors.white
              ),),
              Row(
                children: [
                  Icon(
                    Icons.music_note, size: 15.0, color: Colors.white,
                  ),
                  Text("Artist Name - Album name - song", style: TextStyle(
                    fontSize: 12.0, color: Colors.white
                  ),)
                ],
              ),
            ],
          ),
        )
    );
  }
}
