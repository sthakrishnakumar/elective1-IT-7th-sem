import 'dart:developer';

import 'package:elective/quiz/quiz_result_model.dart';
import 'package:flutter/material.dart';

import 'quiz_model.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({required this.quizList, super.key});
  final List<QuizModel> quizList;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int quizIndex = 0;
  int optionIndex = 4;

  List<QuizResultModel> quizResultList = [];
  @override
  Widget build(BuildContext context) {
    log("Result count is ${quizResultList.length}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                  "${(quizIndex + 1)}. ${widget.quizList[quizIndex].question}"),
              ...widget.quizList[quizIndex].options().map(
                    (e) => InkWell(
                      onTap: () {
                        setState(() {
                          optionIndex =
                              widget.quizList[quizIndex].options().indexOf(e);
                        });
                      },
                      child: Card(
                        color: optionIndex ==
                                widget.quizList[quizIndex].options().indexOf(e)
                            ? Colors.blue
                            : Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(e),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ElevatedButton(
                onPressed: () {
                  if (optionIndex < 4) {
                    if (quizIndex < widget.quizList.length - 1) {
                      final quizResultModel = QuizResultModel(
                        question: widget.quizList[quizIndex].question,
                        correctAnswer: widget.quizList[quizIndex].correctAnswer,
                        selectedAnswer:
                            widget.quizList[quizIndex].options()[optionIndex],
                      );
                      setState(() {
                        optionIndex = 4;
                        quizIndex = quizIndex + 1;
                        quizResultList.add(quizResultModel);
                      });
                    } else {
                      //Submit remaining
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Options must be selected"),
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                  }
                },
                child: Text(quizIndex == widget.quizList.length - 1
                    ? "Submit"
                    : "Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
