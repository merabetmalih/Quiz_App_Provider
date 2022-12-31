import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp01_exo02/questions_state.dart';

import 'question.dart';

void main() {
  runApp(const MaterialApp(
    title: "Quiz app",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuestionsState())
      ],
      child: MaterialApp(
        routes: {"/": (context) => MyQuizPage()},
      ),
    );
  }
}

class MyQuizPage extends StatefulWidget {
  const MyQuizPage({Key? key}) : super(key: key);

  @override
  _MyQuizPageState createState() => _MyQuizPageState();
}

class _MyQuizPageState extends State<MyQuizPage> {
  SnackBar correctAnswer() {
    var snackMessage = "The answer is correct";
    var snackColor = Colors.green;

    return SnackBar(
      content: Text(
        snackMessage,
        textAlign: TextAlign.center,
        style: TextStyle(color: snackColor),
      ),
    );
  }

  SnackBar badAnswer() {
    var snackColor = Colors.red;
    var snackMessage = "Sorry,Try again";
    return SnackBar(
      content: Text(
        textAlign: TextAlign.center,
        snackMessage,
        style: TextStyle(color: snackColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue, title: Text("Quiz App")),
        body: SafeArea(child: Center(
          child: Consumer<QuestionsState>(
            builder: (context, value, child) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.red,
                            width: 5,
                          )),
                          child: Image.network(
                              value.questions[value.questionId].image),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                          margin: EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              value.questions[value.questionId].question,
                              style: const TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ))),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {
                              if (value.questions[value.questionId].answer ==
                                  true) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(correctAnswer());
                                value.updateQuestions();
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(badAnswer());
                              }
                            },
                            child: Text("Vrai")),
                      )),
                      Expanded(
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                              onPressed: () {
                                if (value.questions[value.questionId].answer ==
                                    false) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(correctAnswer());
                                  value.updateQuestions();
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(badAnswer());
                                }
                              },
                              child: Text("Faux")))
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            value.updateQuestions();
                          });
                        },
                        child: Icon(
                          Icons.arrow_forward,
                        )),
                  )
                ],
              ));
            },
          ),
        )));
  }
}
