import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:referease/commonwidget/fancybutton.dart';
import 'package:referease/data/api_functions/summary/request_summaries_api.dart';
import 'package:referease/model/summary_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:referease/uipage/summary/summarydetail.dart';
import 'package:referease/uipage/widgets/summary_list.dart';

class SummaryPage extends StatefulWidget{
  @override
  _SummaryPageState createState()=>  _SummaryPageState();

}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:buildSummaryList(context),
      floatingActionButton: FancyButton(icon: Icons.add_box,
      inst: "New Summary",
      onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SummaryDetail(type:"reflect"),) );
      },),
    );
  }

  FutureBuilder<Response<BuiltList<SummaryModel>>> buildSummaryList(
      BuildContext context) {
    return FutureBuilder<Response<BuiltList<SummaryModel>>>(
      future: requestSummaries(context),
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
          final BuiltList<SummaryModel> summaries = snapshot.data.body;
          return SummaryList(summaries: summaries);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

}