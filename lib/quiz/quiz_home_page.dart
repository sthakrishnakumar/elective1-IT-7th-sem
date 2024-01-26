import 'package:elective/quiz/quiz_page.dart';
import 'package:elective/quiz/quiz_repository.dart';
import 'package:flutter/material.dart';

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({super.key});

  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Home"),
      ),
      body: FutureBuilder(
        future: QuizRepository().getQuiz(),
        builder: (ctx, snap) {
          if (snap.hasData) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => QuizPage(quizList: snap.data!),
                    ),
                  );
                },
                child: const Text("Start Quiz"),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
