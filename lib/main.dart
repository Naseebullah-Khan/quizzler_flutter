import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.questions[questionIndex].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: Text('True', style: TextStyle(fontSize: 20.0)),
              onPressed: () {
                setState(() {
                  if (quizBrain.questions[questionIndex].questionAnswer ==
                      true) {
                    questionIndex++;
                    scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                  } else {
                    questionIndex++;
                    scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: Text('False', style: TextStyle(fontSize: 20.0)),
              onPressed: () {
                setState(() {
                  if (quizBrain.questions[questionIndex].questionAnswer ==
                      false) {
                    questionIndex++;
                    scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                  } else {
                    questionIndex++;
                    scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                  }
                });
              },
            ),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }
}
