import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:referease/uiutility/colors.dart';


class FancyButton extends StatelessWidget{

  final GestureTapCallback onPressed;
  final IconData icon;
  final String inst;


  FancyButton({@required this.onPressed, this.icon, this.inst}):assert(icon!=null),assert(inst!=null);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
      fillColor: kReferAccent,
      splashColor: kReferPrimary,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon),
            SizedBox(width: 18.0,),
            Text(inst)
          ],
        ),
      ),

      onPressed: onPressed,
      shape: const StadiumBorder(),

    );
  }
}