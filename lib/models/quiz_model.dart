import 'package:flutter_quiz_app/models/question_model.dart';

class Quiz {
  final int id;
  final String name;
  final List<Question> questions;

  Quiz(this.id, this.name, this.questions);
}
