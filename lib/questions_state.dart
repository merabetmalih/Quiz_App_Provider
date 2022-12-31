import 'package:flutter/cupertino.dart';

import 'question.dart';

class QuestionsState extends ChangeNotifier {
  var questions = [
    Question("Les chevaux sont des mammifères ?", true,
        "https://i0.wp.com/www.hadviser.com/wp-content/uploads/2021/04/1-brunette-hair-with-partial-caramel-highlights-CQ8Q3WSp9ZZ.jpg"),
    Question(
        "La distance entre la terre et le soleil est de 150 millions de kilomètres",
        true,
        "https://static01.nyt.com/images/2020/10/29/style/28MOON-01/oakImage-1603985177355-facebookJumbo.jpg?year=2020&h=549&w=1050&s=222c2466d9d8e066c2337256d58dbf49f816c84faa4ac2304d6383bdc27f890f&k=ZQJBKqZ0VN"),
    Question(" La plus haute montagne du monde est l'Everest :", true,
        "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006_edit_1.jpg/800px-Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006_edit_1.jpg")
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
