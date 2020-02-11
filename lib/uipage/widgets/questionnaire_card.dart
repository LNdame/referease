import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:referease/data/api_functions/questionnaire/request_question_list.dart';
import 'package:referease/data/api_functions/questionnaire/request_questions.dart';
import 'package:referease/data/questionnaire_api_service.dart';
import 'package:referease/model/question_model.dart';
import 'package:referease/model/questionnaire.dart';
import 'package:referease/uipage/summary/summarydetail.dart';
import 'package:referease/uipage/widgets/questions_list.dart';
import 'package:referease/uiutility/colors.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';

class QuestionnaireCard extends StatefulWidget {
  @override
  _QuestionnaireCardState createState() => _QuestionnaireCardState();
  final Questionnaire questionnaire;
  QuestionnaireCard({this.questionnaire});
}

class _QuestionnaireCardState extends State<QuestionnaireCard> {
  BuiltList<QuestionModel> questionDetails;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    requestQuestionsList(context, widget.questionnaire.id).then((onValue) {
      questionDetails = onValue.body;
    });
    return Container(
      height: 200,
      child: GestureDetector(
        onTap: () {},
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.question_answer),
                    SizedBox(width: 20.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            "Questionnaire Type: ${getTypeName(widget.questionnaire.questionnaire_type_id)}"),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text("Author: ${widget.questionnaire.authors}"),
                        SizedBox(
                          height: 3.0,
                        ),
                        ConstrainedBox(
                            constraints: BoxConstraints.expand(
                                width: 200.0, height: 20.0),
                            child: Text(
                              "Title: ${widget.questionnaire.title}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )),
                      ],
                    )
                  ],
                ), //row
                //row
                SizedBox(height: 8.0),
                Expanded(
                    child: Text(
                  widget.questionnaire.description,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  softWrap: true,
                )),

                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add_circle),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SummaryDetail(
                                      type: getTypeName(widget
                                          .questionnaire.questionnaire_type_id),
                                      questions: questionDetails,
                                      questionnaireId: widget.questionnaire.id,
                                    )));
                      },
                    ),
                    SizedBox(width: 40.0),
                    IconButton(
                      icon: Icon(Icons.view_list),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuestionsList(
                                      questionnaireId: widget.questionnaire.id,
                                      authors: widget.questionnaire.authors,
                                      title: widget.questionnaire.title,
                                    )));
                      },
                    ),
                  ],
                )
              ], //children
            ),
          ),
        ),
      ),
    );
  }

  getTypeName(int questionnaire_type_id) {
    if (questionnaire_type_id == 1) {
      return "reflect";
    } else {
      return "discuss";
    }
  }

  FutureBuilder<Response> buildQuestionsList(BuildContext context) {
    return FutureBuilder<Response>(
      future: requestQuestions(context, widget.questionnaire.id),
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
          // final Map<String, dynamic> questionnaires = snapshot.data.body;
          final questionnaire = snapshot.data.body;
          questionDetails = questionnaire['questions'];
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
