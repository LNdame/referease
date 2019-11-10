import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:referease/data/questionnaire_api_service.dart';
import 'package:referease/model/questionnaire.dart';
import 'package:referease/uiutility/colors.dart';
import 'dart:convert';
import 'package:provider/provider.dart';


class QuestionnaireCard extends StatelessWidget {
  final Questionnaire questionnaire;

  QuestionnaireCard({this.questionnaire});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: GestureDetector(
        child: Card(
          elevation: 3.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("${questionnaire.questionnaire_type_id}", style: TextStyle(
                      fontSize: 20.0,fontWeight: FontWeight.w600,fontStyle: FontStyle.normal,
                    ),),
                    SizedBox(width: 18.0,),
                    Expanded(child: Container(),),
                  ],
                ),
                SizedBox(height: 8.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Author: ${questionnaire.authors}"),
                  ],
                ),
                SizedBox(height: 8.0,),
                ConstrainedBox(constraints:BoxConstraints.expand( width:600.0, height: 20.0) ,
                    child: Text("Title: ${questionnaire.title}",
                      overflow: TextOverflow.ellipsis,)),

                Expanded(child: Text("${questionnaire.description}",
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  softWrap: true,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}