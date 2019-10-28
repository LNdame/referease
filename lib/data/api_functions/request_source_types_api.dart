import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:referease/model/source_type.dart';
import 'package:referease/shared_preference/sharedpreference.dart';
import '../source_type_api_service.dart';

Future requestSourTypesAPI(BuildContext context) async{
  final response = await Provider.of<SourceTypeApiService>(context).getSourceTypes();
  if(response.statusCode==200){
    BuiltList<SourceType> sourceTypes = response.body;
    SharedPreferencesUtils.setSourceTypes(getSourceTypeNameList(sourceTypes));
  }
}

List<String> getSourceTypeNameList(BuiltList<SourceType> list) {
  List<String> sourceTypesName = new List<String>();
  for (SourceType st in list) {
    sourceTypesName.add(st.name);
  }
  return sourceTypesName;
}
