import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:built_collection/built_collection.dart';
import 'package:referease/commonwidget/fancybutton.dart';
import 'package:referease/data/api_functions/questionnaire/request_questions.dart';
import 'package:referease/uipage/summary/summarydetail.dart';
import 'package:referease/uiutility/colors.dart';

import '../../model/question_model.dart';


class QuestionsList extends StatelessWidget{
  final int id;
  final String authors;
  final String title;
  final int questionnaire_type_id;

  QuestionsList({this.id, this.authors, this.title, this.questionnaire_type_id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar:AppBar(
        brightness: Brightness.light,
        backgroundColor: kReferSurfaceWhite,
        leading: BackButton(color: kReferAccent,),
      ),
    body: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 90,
                        child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                           child: Text("Tittle: $title",
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold 
                                ),
                              ),
                            )
                          ],

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text("Authors: $authors",
                              style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold 
                              )
                            )
                          ],

                        ),

                                ],
                              ),
                            ),
                        ),
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              child: SizedBox(
                                height: 400.0,
                                child: buildQuestionsList(context)
                              ),
                            ),
                        ],
                        )
                    ],//children

                  ),
     //buildQuestionsList(context)
         floatingActionButton: FancyButton(icon: Icons.add_box,
          inst: "Start A summary",
          onPressed: (){
               Navigator.push(
                    context,
                    MaterialPageRoute (
                    builder: (context) => SummaryDetail(type: getTypeName(questionnaire_type_id))) 
                                                                            );
                           
                              }) ,       
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
                                              Text("${index + 1}",
                                            
                                              ),
                                              SizedBox(width: 15),
                                                  Expanded(child: Text(questionnaires[index]['question_body'],
                                            textAlign: TextAlign.justify,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                            softWrap: true,
                                              )
                                            ),
                                            ],
                                            ),
                                       
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
                    
                      getTypeName(questionnaire_type_id) {
                        if (questionnaire_type_id == 1) {
                            return "reflect";
                          }
                          else {
                            return "discuss";
                          }
                      }

}