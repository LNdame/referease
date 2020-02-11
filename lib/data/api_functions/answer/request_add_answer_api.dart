import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/answer_api_service.dart';

import 'package:referease/model/answer_model.dart';

Future<Response<AnswerModel>> requestAddAnswer(BuildContext context, AnswerModel answer, String bearer)async{
  bool isOK=false;

  final response = await Provider.of<AnswerApiService>(context).addAnswer(bearer, answer);

  if(response.statusCode==201){
    return response;
  }

  return response;
}