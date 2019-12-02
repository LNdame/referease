import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:referease/commonwidget/flexiblespacecustom.dart';
import 'package:referease/data/api_functions/questionnaire/request_questionnaire_api.dart';
import 'package:referease/model/questionnaire.dart';
import 'package:referease/uipage/widgets/questionnaire_list.dart';
import 'package:built_collection/built_collection.dart';

class QuestionnairePage extends StatefulWidget {
  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage>
    with SingleTickerProviderStateMixin {
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 150.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBarCustom(
                  title: "Questionnaires",
                  pageId: 3,
                )),
          ];
        },
        body: buildQuestionnaireList(context),
      ),
    );
  }
}

FutureBuilder<Response<BuiltList<Questionnaire>>> buildQuestionnaireList(
    BuildContext context) {
  return FutureBuilder<Response<BuiltList<Questionnaire>>>(
    future: requestQuestionnaires(context),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
            ),
          );
        }
        final BuiltList<Questionnaire> questionnaires = snapshot.data.body;
        return QuestionnaireList(questionnaires: questionnaires);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
