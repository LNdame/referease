import 'package:flutter/material.dart';
import 'summary_card.dart';

//DATA TODO implement a data repo

import 'package:referease/data/summary_data.dart';

import 'package:referease/model/summary.dart';

class SummaryList extends StatelessWidget{

  final List<Summary> _summaries = summaries;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _summaries.length,
      itemBuilder: (BuildContext context, int index){
        return SummaryCard(
            summary:_summaries[index]);
      },

    );
  }

}


