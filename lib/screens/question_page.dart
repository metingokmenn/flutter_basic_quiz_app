import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/result_page.dart';

import '../models/question_model.dart';
import '../models/quiz_model.dart';

class QuestionPage extends StatefulWidget {
  final Quiz quiz;
  const QuestionPage({required this.quiz, super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late List<Question> questionList;
  late final PageController _controller;
  late List allAnswers;
  int pageCounter = 1;

  @override
  void initState() {
    super.initState();
    questionList = widget.quiz.questions;
    _controller = PageController();
    allAnswers = [false, false, false, false, false];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.quiz.name,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${pageCounter.toString()} / 5',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              children: [
                for (var i in questionList)
                  Column(
                    children: [
                      Text(i.question!),
                      answerList(questionList.indexOf(i)),
                    ],
                  )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    if (pageCounter != 1) {
                      pageCounter--;
                    }

                    _controller.previousPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeIn);
                    setState(() {});
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              IconButton(
                  onPressed: () {
                    if (pageCounter != 5) {
                      pageCounter++;
                    }
                    allAnswers.removeAt(_controller.page!.toInt());
                    allAnswers.insert(
                        _controller.page!.toInt(),
                        checkQuestionCorrection(
                            _controller.page!.toInt(),
                            questionList[_controller.page!.toInt()]
                                .selectedAnswer));

                    _controller.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeIn);

                    setState(() {});
                  },
                  icon: const Icon(Icons.arrow_forward_ios))
            ],
          )
        ],
      ),
    );
  }

  Widget answerList(int pageIndex) {
    bool isLastPage = pageIndex == 4;
    return (!isLastPage)
        ? Expanded(
            child: optionsView(pageIndex, false),
          )
        : Expanded(
            child: optionsView(pageIndex, true),
          );
  }

  ListTile buildListTiles(int pageIndex, String value, int answerIndex) {
    return ListTile(
      title: Text(
          questionList[pageIndex].answers!.toList()[answerIndex].toString()),
      leading: Radio(
        groupValue: questionList[pageIndex].selectedAnswer,
        value: value,
        onChanged: (value) {
          setState(() {
            questionList[pageIndex].selectedAnswer = value;
          });
        },
      ),
    );
  }

  bool checkQuestionCorrection(int pageIndex, String? value) {
    late bool questionCorrection;
    switch (value) {
      case 'A':
        questionCorrection =
            questionList[pageIndex].correctAnswers!.answerACorrect!;

        break;
      case 'B':
        questionCorrection =
            questionList[pageIndex].correctAnswers!.answerBCorrect!;

        break;
      case 'C':
        questionCorrection =
            questionList[pageIndex].correctAnswers!.answerCCorrect!;

        break;
      case 'D':
        questionCorrection =
            questionList[pageIndex].correctAnswers!.answerDCorrect!;

        break;
    }
    debugPrint(questionCorrection.toString());
    return questionCorrection;
  }

  ListView optionsView(int pageIndex, bool isLastPage) {
    return isLastPage
        ? ListView(
            children: [
              buildListTiles(pageIndex, 'A', 0),
              buildListTiles(pageIndex, 'B', 1),
              buildListTiles(pageIndex, 'C', 2),
              buildListTiles(pageIndex, 'D', 3),
              ElevatedButton(
                  onPressed: () {
                    allAnswers.removeAt(_controller.page!.toInt());
                    allAnswers.insert(
                        _controller.page!.toInt(),
                        checkQuestionCorrection(
                            _controller.page!.toInt(),
                            questionList[_controller.page!.toInt()]
                                .selectedAnswer));
                    debugPrint(allAnswers.toString());

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ResultPage(
                                  answerList: allAnswers,
                                ))));
                  },
                  child: const Text('Submit'))
            ],
          )
        : ListView(
            children: [
              buildListTiles(pageIndex, 'A', 0),
              buildListTiles(pageIndex, 'B', 1),
              buildListTiles(pageIndex, 'C', 2),
              buildListTiles(pageIndex, 'D', 3),
            ],
          );
  }
}
