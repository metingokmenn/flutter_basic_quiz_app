import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quiz_app/models/question_model.dart';
import 'package:flutter_quiz_app/services/question_service.dart';
import 'package:hive/hive.dart';

class LocalJSONService implements QuestionService {
  @override
  Future<List<Question>> getAllQuestions() async {
    String response = await rootBundle.loadString('assets/json/questions.json');
    List data = json.decode(response);
    List<Question> allQuestions = data.map((e) => Question.fromMap(e)).toList();
    debugPrint(allQuestions.toString());

    var box = Hive.box<List<Question>>('questions');
    box.put(0, allQuestions);
    
    return allQuestions;
  }
}
