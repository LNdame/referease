import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:built_collection/built_collection.dart';
import 'package:referease/data/api_functions/questionnaire/request_questions.dart';
import 'package:referease/uiutility/colors.dart';

import '../../model/question_model.dart';


class QuestionsList extends StatelessWidget{
  final int id;

  QuestionsList({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar:AppBar(
        brightness: Brightness.light,
        backgroundColor: kReferSurfaceWhite,
        leading: BackButton(color: kReferAccent,),
      ),
    body: buildQuestionsList(context)
                
    );
    }


      FutureBuilder<Response> buildQuestionsList(BuildContext context){
    return FutureBuilder<Response>(
      future: requestQuestions(context, id),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
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
          var body = questionnaire['questions'];          
         return _buildQuestions(context, body);
           
                  }else{
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ); 
            }
          
        ListView _buildQuestions(BuildContext context, dynamic questionnaires) {
            return ListView.builder(
                itemCount: questionnaires.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (context, index) {
          return Container(
            height: 150,
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.question_answer, size: 45.0, color: kReferAccent,)
                        ],

                      ),
                   

             
                     Expanded(child: Text(questionnaires[index]['question_body'],
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        softWrap: true,
                      )),
                    ],//children

                  ),
                ),
        ),
            ),
            
          )
      
    //           onTap: (){
    //             // TODO implement a gesture
    //              Navigator.push(
    // context,
    //           },
             ;},
             );
           }

}