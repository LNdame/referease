import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:referease/data/questionnaire_api_service.dart';
import 'package:referease/model/questionnaire.dart';
import 'package:referease/uipage/summary/summarydetail.dart';
import 'package:referease/uipage/widgets/questions_list.dart';
import 'package:referease/uiutility/colors.dart';
import 'dart:convert';
import 'package:provider/provider.dart';


class QuestionnaireCard extends StatelessWidget {
  final Questionnaire questionnaire;

  QuestionnaireCard({this.questionnaire});

  @override
  Widget build(BuildContext context) {
     return Container(
            height: 200,
            child: GestureDetector(
              onTap: () {
            // var id = questionnaires[index]["id"];
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Questions(id: id)));
            

              },
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
                             Text("Questionnaire Type: ${getTypeName(questionnaire.questionnaire_type_id)}"),
                             SizedBox(height: 3.0,),
                             Text("Author: ${questionnaire.authors}"),
                             SizedBox(height: 3.0,),
                              ConstrainedBox(constraints:BoxConstraints.expand( width:200.0, height: 20.0) ,
                              child: Text("Title: ${questionnaire.title}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontWeight: FontWeight.w600),)),
                          ],)
                        ],

                      ),//row
                      //row
                      SizedBox(height: 8.0,),
                                           Expanded(child: Text(questionnaire.description,
                                              textAlign: TextAlign.justify,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 4,
                                              softWrap: true,
                                            )),
                      
                      
                                            SizedBox(height: 10.0,),
                                            Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                              children: <Widget>[
                                                  IconButton(
                                                    icon: Icon(Icons.add_circle),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute (
                                                          builder: (context) => SummaryDetail(type: getTypeName(questionnaire.questionnaire_type_id))) 
                                                        );
                                                    },
                                                    ),
                                                  SizedBox(width: 40.0),
                                                  IconButton(
                                                    icon: Icon(Icons.view_list),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute (
                                                          builder: (context) => QuestionsList(id: questionnaire.id, authors: questionnaire.authors, title: questionnaire.title,)) 
                                                        );
                                                    },
                                                    ),
                                            ],)
                                            
                      
                                          ],//children
                      
                                        ),
                                      ),
                              ),
                                  ),
                                  
                                );
                        }
                      
                        getTypeName(int questionnaire_type_id) {
                          if (questionnaire_type_id == 1) {
                            return "reflect";
                          }
                          else {
                            return "discuss";
                          }
                        }
}