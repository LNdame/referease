import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referease/commonwidget/fancybutton.dart';
import 'package:referease/data/api_functions/source/request_sources_api.dart';
import 'package:referease/data/source_api_service.dart';
import 'package:referease/model/source_model.dart';
import 'package:referease/uipage/pages/helpers/source_open_dialog.dart';
import 'package:referease/uipage/widgets/source_list.dart';
import 'package:built_collection/built_collection.dart';

class SourcePage extends StatefulWidget{
  @override
  _SourcePageState createState()=>  _SourcePageState();
}

class _SourcePageState extends State<SourcePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: buildSourceList(context),
      floatingActionButton: FancyButton(icon: Icons.add_box,
          inst: "New source",
          onPressed: (){
            sourceOpenDialog(context);
          }) ,
    );
  }

  FutureBuilder<Response<BuiltList<SourceModel>>> buildSourceList(BuildContext context){
    return FutureBuilder<Response<BuiltList<SourceModel>>>(
      future: requestSources(context),
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
          final BuiltList<SourceModel> sources = snapshot.data.body;
           return SourceList(sources: sources);
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ); 
  }
}