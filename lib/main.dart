import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(MyApp());

// Inheritance
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override // Polymorphism
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

// Inheritance
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override // Polymorphism
  State<QuizPage> createState() => _QuizPageState();
}

// Inheritance
class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool answer) {
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: "Finished!",
          desc: "You've reached the end of the quiz.",
        ).show();
        scoreKeeper.clear();
        quizBrain.reset();
      } else {
        if (quizBrain.getQuestionAnswer() == answer) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }

        quizBrain.getNextQuestion();
      }
    });
  }

  @override // Polymorphism
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
                quizBrain.getQuestionText(),
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
              onPressed: () => checkAnswer(true),
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
              onPressed: () => checkAnswer(false),
            ),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }
}
