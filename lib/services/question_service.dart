import 'package:flutter_quiz_app/models/question_model.dart';

abstract class QuestionService {
  Future<List<Question>> getAllQuestions();
}
