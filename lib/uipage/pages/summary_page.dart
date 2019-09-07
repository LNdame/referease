import 'package:flutter/material.dart';
//import 'package:referease/uipage/summary/summarylist.dart';
import 'package:referease/uipage/widgets/summary_list.dart';

class SummaryPage extends StatefulWidget{
  @override
  _SummaryPageState createState()=>  _SummaryPageState();

}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:SummaryList(),

    );
  }
}