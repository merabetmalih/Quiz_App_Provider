import 'package:flutter/cupertino.dart';

import 'question.dart';

class QuestionsState extends ChangeNotifier {
  var questions = [
    Question("Is Flutter created by Google?", true,
        "https://docs.flutter.dev/assets/images/flutter-logo-sharing.png"),
    Question("Is Kotlin programming language used by Flutter?", false,
        "https://www.sngular.com/wp-content/uploads/2019/11/Kotlin-Blog.png"),
    Question(
        " Dart programing language created by Lars Bak and Kasper Lund.",
        true,
        "https://www.extremetech.com/wp-content/uploads/2011/10/dart-logo-banner1-640x353.jpg")
  ];

  int questionId = 0;

  void updateQuestions() {
    if (questionId != questions.length - 1) {
      questionId = questionId + 1;
    } else {
      questionId = 0;
    }
    notifyListeners();
  }
}
