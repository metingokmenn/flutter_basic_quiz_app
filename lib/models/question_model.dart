import 'package:hive/hive.dart';
import 'dart:convert';

part 'question_model.g.dart';

Question? questionFromMap(String str) => Question.fromMap(json.decode(str));

String questionToMap(Question? data) => json.encode(data!.toMap());

@HiveType(typeId: 1)
class Question {
  Question({
    required this.id,
    required this.question,
    required this.selectedAnswer,
    required this.answers,
    required this.correctAnswers,
  });

  @HiveField(1)
  final int? id;
  @HiveField(2)
  final String? question;
  @HiveField(3)
  String? selectedAnswer;
  @HiveField(4)
  final Answers? answers;
  @HiveField(5)
  final CorrectAnswers? correctAnswers;

  factory Question.fromMap(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        selectedAnswer: json["selected_answer"],
        answers: Answers.fromMap(json["answers"]),
        correctAnswers: CorrectAnswers.fromMap(json["correct_answers"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "question": question,
        "selected_answer": selectedAnswer,
        "answers": answers!.toMap(),
        "correct_answers": correctAnswers!.toMap(),
      };
}

@HiveType(typeId: 2)
class Answers {
  Answers({
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
  });

  @HiveField(1)
  final String? answerA;
  @HiveField(2)
  final String? answerB;
  @HiveField(3)
  final String? answerC;
  @HiveField(4)
  final String? answerD;

  factory Answers.fromMap(Map<String, dynamic> json) => Answers(
        answerA: json["answer_a"],
        answerB: json["answer_b"],
        answerC: json["answer_c"],
        answerD: json["answer_d"],
      );

  Map<String, dynamic> toMap() => {
        "answer_a": answerA,
        "answer_b": answerB,
        "answer_c": answerC,
        "answer_d": answerD,
      };

  List toList() {
    return [answerA, answerB, answerC, answerD];
  }
}

@HiveType(typeId: 3)
class CorrectAnswers {
  CorrectAnswers({
    required this.answerACorrect,
    required this.answerBCorrect,
    required this.answerCCorrect,
    required this.answerDCorrect,
  });

  @HiveField(1)
  final bool? answerACorrect;
  @HiveField(2)
  final bool? answerBCorrect;
  @HiveField(3)
  final bool? answerCCorrect;
  @HiveField(4)
  final bool? answerDCorrect;

  factory CorrectAnswers.fromMap(Map<String, dynamic> json) => CorrectAnswers(
        answerACorrect: json["answer_a_correct"],
        answerBCorrect: json["answer_b_correct"],
        answerCCorrect: json["answer_c_correct"],
        answerDCorrect: json["answer_d_correct"],
      );

  Map<String, dynamic> toMap() => {
        "answer_a_correct": answerACorrect,
        "answer_b_correct": answerBCorrect,
        "answer_c_correct": answerCCorrect,
        "answer_d_correct": answerDCorrect,
      };

  List<bool> toList() =>
      [answerACorrect!, answerBCorrect!, answerCCorrect!, answerDCorrect!];
}
