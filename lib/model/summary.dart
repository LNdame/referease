

import 'package:referease/model/question.dart';

class Summary {


  final List<String> answers;
  final List<Question> questions;
 final String authors, title, type, uid, year;
 final String createdDate;

  Summary({this.answers, this.questions, this.authors, this.title, this.type, this.uid,
      this.year,this.createdDate });


  var now = DateTime.now();

  Map<String , dynamic> saveToJson() =>{

  'type': type,
  'title' : title,
  'authors':authors,
  'year':year,
  'questions':questions.map((question)=>"${question.questionDesc}").toList(),
  'answers': answers,
  'uid':uid,
  'created_date': now.toString()
  };


  Map<String , dynamic> updateToJson() =>{

    'type': type,
    'title' : title,
    'authors':authors,
    'year':year,
    'questions':questions.map((question)=>"${question.questionDesc}").toList(),
    'answers': answers,
    'uid':uid,
   
  };


}