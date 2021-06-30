import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:videshot_app/widgets/actions_toolbar.dart';
import 'package:videshot_app/widgets/bottom_toolbar.dart';
import 'package:videshot_app/widgets/video_description.dart';

class HomeScreen extends StatelessWidget {

  Widget get topSection => Container(
    height: 100,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Following",
        style: TextStyle(
          color: Colors.white
        ),),
        Container(
          width: 15.0,
        ),
        Text("For You",
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ],
    ),
  );

  Widget get middleSection => Expanded(
    child: Row(
      mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
         VideoDescription(),
         ActionsToolbar(),
        ]),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[

          //Top Section
          topSection,

          //Middle Section
          middleSection,

          //Bottom Section
          BottomToolbar(),

        ],
      ),
    );
  }
}
