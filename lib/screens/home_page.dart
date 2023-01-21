import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/quiz_model.dart';
import 'package:flutter_quiz_app/screens/question_page.dart';
import 'package:hive/hive.dart';
import 'package:flutter_quiz_app/models/question_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box box = Hive.box<List<Question>>('questions');

  late List<Quiz> allQuizzes;
  late Quiz quiz1;

  @override
  void initState() {
    quiz1 = Quiz(0, 'Quiz1', box.get(0));
    allQuizzes = List.generate(box.length, (index) => quiz1);
    box.close();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes'),
        centerTitle: false,
      ),
      body: GridView.builder(
          itemCount: allQuizzes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: ((context, index) {
            var currentQuiz = allQuizzes[0];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => QuestionPage(
                          quiz: currentQuiz,
                        )),
                  ),
                );
              },
              child: Card(
                color: Colors.blueAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentQuiz.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
