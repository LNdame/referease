import 'package:flutter/material.dart';

class FlexibleSpaceBarCustom extends StatelessWidget{
  final String title ;
  final int pageId ;
  static final int summaryPage = 1;
  static final int sourcePage = 2;
  static final int questionnairePage = 3;
  static final int profilePage = 4;

  FlexibleSpaceBarCustom({this.title, this.pageId});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      title: Text(title,
          style: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColorLight)
      ),
      background: Image.asset(assetPath(pageId), fit: BoxFit.cover,),
    );
  }

  String assetPath (int pageId){
    switch(pageId){
      case 1: return "assets/images/summary_header.jpg"; break;
      case 2: return "assets/images/source_header.jpg"; break;
      case 3: return "assets/images/questionnaire_header.jpg"; break;
      case 4: return "assets/images/profile_header.jpg"; break;
      default: return "assets/images/source_header.jpg"; break;
    }
  }


  
}