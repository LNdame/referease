import 'package:flutter/material.dart';
import 'source_card.dart';


import 'package:referease/data/source_data.dart';

import 'package:referease/model/source.dart';

class SourceList extends StatelessWidget{
  final List<Source> _sources = sources;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _sources.length,
      itemBuilder: (BuildContext context, int index){
        return SourceCard(
            source:_sources[index]);
      },

    );
  }
}