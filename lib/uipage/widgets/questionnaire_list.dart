import 'package:flutter/material.dart';
import 'package:referease/model/questionnaire.dart';
import 'package:built_collection/built_collection.dart';
import 'package:referease/uipage/widgets/questionnaire_card.dart';
import 'gb_teacher.dart' as teacher;


//DATA TODO implement a data repo

class QuestionnaireList extends StatefulWidget {
  final BuiltList<Questionnaire> questionnaires;
  QuestionnaireList({Key key, this.questionnaires}) : super(key: key);

  @override
  _QuestionnaireListState createState() => _QuestionnaireListState();
}

class _QuestionnaireListState extends State<QuestionnaireList> with SingleTickerProviderStateMixin {

TabController controller;
@override
void initState() {
  super.initState();
 // controller = new TabController(vsync: this, length: 2);
}

@override
void dispose() {
//  controller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.questionnaires.length,
      itemBuilder: (BuildContext context, int index) {
        return QuestionnaireCard(questionnaire: widget.questionnaires[index]);
      },
    );
  }
}
