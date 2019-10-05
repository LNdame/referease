import 'dart:convert';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'questionnaire.g.dart';

abstract class Questionnaire implements Built<Questionnaire, QuestionnaireBuilder>{

  @nullable
  int get id;

  String get authors;
  String get title;
  String get description;
  int get questionnaire_type_id;
  int get user_id;

  Questionnaire._();

  factory Questionnaire([updates(QuestionnaireBuilder b)]) = _$Questionnaire;

  static Serializer<Questionnaire> get serializer => _$questionnaireSerializer;

}


/**
    "authors": "loic Andre",
    "title": "test title",
    "description": "test description",
    "questionnaire_type_id": 1,
    "user_id": 1,
    "questions": [],
    "id": 1
*/