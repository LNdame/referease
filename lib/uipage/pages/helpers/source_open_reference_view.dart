import 'dart:async';

import 'package:flutter/material.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:share/share.dart';

Future<Null>openReferenceView(BuildContext context, String reference, String style) async{
  await showDialog(context: context,
      builder:(BuildContext context){

        return SimpleDialog(
          contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 0.0 ),
          children: <Widget>[
            Container(
              color:kReferPrimary,//kReferBackgroundWhite,
              margin: EdgeInsets.all(2.0),
              height: 40.0,
              child: Column(
                children: <Widget>[
                  Container(
                    color: kReferPrimary,
                    child: Text("$style Reference", style: TextStyle(fontSize: 25.0,color: Colors.white, fontWeight: FontWeight.bold)
                    ),
                    margin: EdgeInsets.only(bottom: 10.0),
                  ),
                ],
              ),//column
            ),
            SimpleDialogOption(
              child: Column(
                children: <Widget>[
                  Text(reference, style:TextStyle(inherit: true, color: Colors.black, fontSize: 14.0, fontFamily: "Montserrat") ,),
                ],
              ),
            ),
            SimpleDialogOption(
              child: Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: (){
                        Share.share("$reference");
                      },
                      icon:  Icon(Icons.share),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      } //builder
  );
}
