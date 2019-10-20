import 'package:flutter/material.dart';

import 'gb_teacher.dart' as teacher;


//DATA TODO implement a data repo

import 'package:referease/data/summary_data.dart';

import 'package:referease/model/summary.dart';

class QuestionnaireList extends StatefulWidget {
  QuestionnaireList({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _QuestionnaireListState createState() => _QuestionnaireListState();
}


class _QuestionnaireListState extends State<QuestionnaireList> with SingleTickerProviderStateMixin {

TabController controller;
@override
void initState() {
  super.initState();
  controller = new TabController(vsync: this, length: 2);
}

@override
void dispose() {
  controller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
       return new Scaffold(
        appBar: new AppBar(backgroundColor: Colors.green,
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
           new Tab(icon: new Icon(Icons.view_headline), text: 'Outline'),
           new Tab(icon: new Icon(Icons.person_outline), text: 'Teacher'),
  
        
         


          ],
        ),
        ),
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
         
            new teacher.GbTeacher()
            
          ],
        ),
        
      
    );
  }
}
