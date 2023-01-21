import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/home_page.dart';
import 'package:flutter_quiz_app/services/local_json_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/question_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(QuestionAdapter());
  Hive.registerAdapter(AnswersAdapter());
  Hive.registerAdapter(CorrectAnswersAdapter());

  await Hive.openBox<List<Question>>('questions');

  await LocalJSONService().getAllQuestions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
              elevation: 0,
              backgroundColor: Colors.white),
          scaffoldBackgroundColor: Colors.white),
      home: const HomePage(),
    );
  }
}
