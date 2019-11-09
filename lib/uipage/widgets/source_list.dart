import 'package:flutter/material.dart';
import 'package:referease/model/source_model.dart';
import 'source_card.dart';
import 'package:built_collection/built_collection.dart';

import 'package:referease/model/source.dart';

class SourceList extends StatefulWidget{
  BuiltList<SourceModel> sources;
  SourceList({this.sources});

  @override
  _SourceListState createState() => _SourceListState();
}

class _SourceListState extends State<SourceList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.sources.length,
      itemBuilder: (BuildContext context, int index){
        return SourceCard(
            source:widget.sources[index]);
      },
    );
  }
}