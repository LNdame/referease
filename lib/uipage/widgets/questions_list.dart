import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:referease/commonwidget/fancybutton.dart';
import 'package:referease/data/api_functions/questionnaire/request_question_list.dart';
import 'package:referease/data/api_functions/questionnaire/request_questions.dart';
import 'package:referease/model/question_model.dart';
import 'package:referease/uipage/summary/summarydetail.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:built_collection/built_collection.dart';
class QuestionsList extends StatefulWidget {
  @override
  _QuestionsList createState() => _QuestionsList();

  final int questionnaireId;
  final String authors;
  final String title;
  final int questionnaire_type_id;

  QuestionsList(
      {this.questionnaireId, this.authors, this.title, this.questionnaire_type_id});
}

class _QuestionsList extends State<QuestionsList> {
  BuiltList<QuestionModel> questionDetails;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: kReferSurfaceWhite,
        title: titleWidget(widget.title, widget.authors),
        leading: BackButton(
          color: kReferAccent,
        ),
      ),
      body: Container( 
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage("assets/images/doodlebg.jpg"),
              fit: BoxFit.cover,
            )
          ),
          child: buildQuestionsList(context)),
      floatingActionButton: FancyButton(
          icon: Icons.add_box,
          inst: "Start A summary",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SummaryDetail(
                      questionnaireId: widget.questionnaireId,
                        questions: questionDetails,
                        type: getTypeName(widget.questionnaire_type_id))));
          }),
    );
  }

  FutureBuilder<Response<BuiltList<QuestionModel>>> buildQuestionsList(BuildContext context) {
    return FutureBuilder<Response<BuiltList<QuestionModel>>>(
      future: requestQuestionsList(context, widget.questionnaireId),
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

          questionDetails =  snapshot.data.body;

          return _buildQuestions(context, questionDetails);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildQuestions(BuildContext context, BuiltList<QuestionModel> questionnaires) {
    return ListView.builder(
      itemCount: questionnaires.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Container(
          height: 70,
          child: GestureDetector(
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${index + 1}",
                        ),
                        SizedBox(width: 15),
                        Expanded(
                            child: Text(
                          questionnaires[index].question_body,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          softWrap: true,
                        )),
                      ],
                    ),
                  ], //children
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  getTypeName(questionnaire_type_id) {
    if (questionnaire_type_id == 1) {
      return "reflect";
    } else {
      return "discuss";
    }
  }

  Widget titleWidget(String title, String authors){
    return Container(
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:5.0,bottom: 5.0),
            child: Text(
              "Tittle: $title",
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Text("Authors: $authors",
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
