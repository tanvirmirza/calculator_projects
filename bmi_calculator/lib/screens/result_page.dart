import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/reuseable_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, 
    required this.bmiResult,
    required this.result,
    required this.review,
  });

  final String bmiResult;
  final String result;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
       appBar: AppBar(
          title: const Text("BMI Results"),
          elevation: 0,
        ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           
            Expanded(
              flex: 5,
              child: ReusableCard(
                  onPress: () {},
                  colour: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (result == 'OverWeight') 
                        Text(
                        result.toString(),
                        style: const TextStyle(
                          color: Color(0xFFCC0000),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                        )
                      else if(result == 'Normal')
                        Text(
                        result.toString(),
                        style: const TextStyle(
                          color: Color(0xFF00CC41),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                        )
                        else 
                        Text(
                        result.toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 204, 187, 0),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      Text(
                        bmiResult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        review,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: kBottomContainerHeight,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                color: kBottomContainerColor,
                child: const Center(
                  child: Text(
                    'RE-Calculate',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
