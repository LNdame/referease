import 'dart:convert';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:referease/model/question_model.dart';

part 'questionnaire.g.dart';

abstract class Questionnaire implements Built<Questionnaire, QuestionnaireBuilder>{

  @nullable
  int get id;
  @nullable
  String get authors;
  @nullable
  String get title;
  @nullable
  String get description;
  @nullable
  int get questionnaire_type_id;
  @nullable
  int get user_id;

  @BuiltValueField(wireName: "questions")
  @nullable
  BuiltList<QuestionModel> get questions;

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