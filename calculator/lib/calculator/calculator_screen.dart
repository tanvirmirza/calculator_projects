import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../widgets/app_button.dart';

class CalcultorPage extends StatefulWidget {
  const CalcultorPage({super.key});

  @override
  State<CalcultorPage> createState() => _CalcultorPageState();
}

class _CalcultorPageState extends State<CalcultorPage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    ".",
    "0",
    "ANS",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(children: [
         showInputResult(),
        buttonKey()
      ]),
    );
  }

 

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    finalQuestion = finalQuestion.replaceAll('%', '/100');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }

  Widget showInputResult() {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: Text(
                  userQuestion,
                  style: const TextStyle(fontSize: 20),
                )),
            Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(userAnswer, style: const TextStyle(fontSize: 20)))
          ]));
  }

   Widget buttonKey() {
    return Expanded(
        flex: 2,
        child: GridView.builder(
            itemCount: buttons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return MyButton(
                  buttonTapped: () {
                    setState(() {
                      userQuestion = '';
                      userAnswer = '';
                    });
                  },
                  buttonText: buttons[index],
                  color: Colors.green,
                  textColor: Colors.white,
                );
              } else if (index == 1) {
                return MyButton(
                  buttonTapped: () {
                    setState(() {
                      if (userQuestion.isNotEmpty) {
                        userQuestion = userQuestion.substring(
                            0, userQuestion.length - 1);
                      } else {
                        userQuestion = '';
                      }
                    });
                  },
                  buttonText: buttons[index],
                  color: Colors.red,
                  textColor: Colors.white,
                );
              } else if (index == buttons.length - 2) {
                return MyButton(
                buttonTapped: () {
                  setState(() {
                  if (userAnswer.isNotEmpty) {
                    userQuestion = userAnswer;
                    userAnswer = '';
                  }
                  });
                },
                buttonText: buttons[index],
                color: Colors.deepPurple,
                textColor: Colors.white,
                );
              }
              //NO
              else if (index == buttons.length - 1) {
                return MyButton(
                  buttonTapped: () {
                    setState(() {
                      try {
                        equalPressed();
                      } catch (e) {
                        userAnswer = 'Error';
                      }
                    });
                  },
                  buttonText: buttons[index],
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                );
              } else {
                return MyButton(
                  buttonTapped: () {
                    setState(() {
                      userQuestion += buttons[index];
                    });
                  },
                  color: isOperator(buttons[index])
                      ? Colors.deepPurple
                      : Colors.deepPurple[50],
                  textColor: isOperator(buttons[index])
                      ? Colors.white
                      : Colors.deepPurple,
                  buttonText: buttons[index],
                );
              }
            }),
      );
  }
}




