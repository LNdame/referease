
import 'package:flutter/material.dart';
import 'package:referease/uiutility/colors.dart';
class Reusable {


  static showOverlayInstruction(BuildContext context)async{

    OverlayState overlayState = Overlay.of(context);

    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          top: (MediaQuery.of(context).size.height/2)-35,
          right: (MediaQuery.of(context).size.width/2)-125 ,
          child: Container(
            height: 70,
            width: 250,
            color: kReferAccent,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text("Scroll up and down to see the other fields", style: TextStyle(fontSize: 15.0,color: Colors.white70,fontWeight: FontWeight.w300 )),
          ),
        )
    );

    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 3));
    overlayEntry.remove();

  }
}