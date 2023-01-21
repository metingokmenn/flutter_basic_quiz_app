import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final List answerList;
  const ResultPage({required this.answerList, super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    int correctCount = 0;
    for (var i = 0; i < widget.answerList.length; i++) {
      if (widget.answerList[i] == true) {
        correctCount++;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Congratulations! You have completed the quiz.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text(
            '${correctCount.toString()} / 5',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Close'))
        ],
      ),
    );
  }
}
