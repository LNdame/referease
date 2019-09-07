import 'package:flutter/material.dart';
import 'package:referease/uipage/widgets/source_list.dart';

class SourcePage extends StatefulWidget{
  @override
  _SourcePageState createState()=>  _SourcePageState();

}

class _SourcePageState extends State<SourcePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SourceList(),
    );
  }
}