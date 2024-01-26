import 'dart:convert';
import 'dart:developer';

import 'package:elective/quiz/quiz_model.dart';
import 'package:http/http.dart';

class QuizRepository {
  Future<List<QuizModel>> getQuiz() async {
    var response = await get(
      Uri.parse("https://the-trivia-api.com/v2/questions/"),
    );
    log("Response is ${response.body}");
    var data = jsonDecode(response.body);
    return List.from(data ?? []).map((e) => QuizModel.fromJson(e)).toList();
  }
}
