import 'package:flutter/material.dart';
import 'package:referease/model/source_type.dart';
import 'package:referease/uipage/source/addsource.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Future<Null> sourceOpenDialog(BuildContext context) async{
  switch(
  await showDialog(context: context,

      builder: (BuildContext context){
        return SimpleDialog(
          contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
          children: <Widget>[
            Container(
              color: kReferPrimary,
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
              height: 110.0,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Icon(
                      FontAwesomeIcons.braille,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(bottom: 10.0),
                  ),
                  Text(
                    'Source type',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Please select the type of source',
                    style: TextStyle(color: Colors.white70, fontSize: 14.0),
                  ),
                ],
              ),
            ),

            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 0);
              },
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.book,
                      color: kReferAccent,
                    ),
                    margin: EdgeInsets.only(right: 10.0),
                  ),
                  Text(
                    'Book',
                    style: TextStyle(
                        color: kReferAccent, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 1);
              },
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon( Icons.description,
                      color: kReferAccent,
                    ),
                    margin: EdgeInsets.only(right: 10.0),
                  ),
                  Text(
                    'Conference Proceeding',
                    style: TextStyle(
                        color: kReferAccent, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 2);
              },
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon( Icons.import_contacts,
                      color: kReferAccent,
                    ),
                    margin: EdgeInsets.only(right: 10.0),
                  ),
                  Text(
                    'Journal Article',
                    style: TextStyle(
                        color: kReferAccent, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 3);
              },
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon( Icons.public,
                      color: kReferAccent,
                    ),
                    margin: EdgeInsets.only(right: 10.0),
                  ),
                  Text(
                    'Web',
                    style: TextStyle(
                        color: kReferAccent, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        );//simpleDialog
      }//builder
  )


  ){
    case 0:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddSource(sourceTypeName:SourceTypeName.book),) );
      break;
    case 1:  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddSource(sourceTypeName:SourceTypeName.conference_proceeding),) );
    break;
    case 2:  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddSource(sourceTypeName:SourceTypeName.journal_article),) );
    break;
    case 3:  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddSource(sourceTypeName:SourceTypeName.web),) );
    break;

  }
}