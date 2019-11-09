import 'package:flutter/material.dart';
import 'package:referease/model/summary_model.dart';
import 'summary_card.dart';
import 'package:built_collection/built_collection.dart';

import 'package:referease/data/summary_data.dart';

import 'package:referease/model/summary.dart';

class SummaryList extends StatefulWidget {
  final BuiltList<SummaryModel> summaries;

  SummaryList({this.summaries});

  @override
  _SummaryListState createState() => _SummaryListState();
}

class _SummaryListState extends State<SummaryList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.summaries.length,
      itemBuilder: (BuildContext context, int index) {
        return SummaryCard(summary: widget.summaries[index]);
      },
    );
  }
}
