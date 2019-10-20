import 'package:flutter/material.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:referease/uipage/questionnaire_card.dart' as card;

//DATA TODO implement a data repo


class QuestionnaireList extends StatefulWidget {
  
  @override
  _QuestionnaireListState createState() => _QuestionnaireListState();
}


class _QuestionnaireListState extends State<QuestionnaireList> with SingleTickerProviderStateMixin {

TabController controller;
@override
void initState() {
  super.initState();

}

@override
void dispose() {
  controller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
       return new Scaffold(
        //appBar: new AppBar( backgroundColor: kReferPrimary, title: Text('Questionnaires', style: TextStyle(color: kReferAccent)),),
        body: card.Questionnaire_Card(),
      
    );
  }
}
