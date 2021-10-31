import 'package:flutter/material.dart';
import 'package:true_or_false/widget/bottom_button.dart';
import 'package:true_or_false/widget/reusable_Card.dart';

import '../constants.dart';

class Result extends StatelessWidget {
  // Result({
  //   required this.interpretation,
  //   required this.bmiResult,
  //   required this.resultText,
  // });

  // final String bmiResult;
  // final String resultText;
  // final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Master'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'VOTRE RESULTAT',
                style: kTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              kActiveCardColour,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'resultText'.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    'bmiResult',
                    style: kBMIStyle,
                  ),
                  Text(
                    'interpretation',
                    textAlign: TextAlign.center,
                    style: kBodyStyle,
                  ),
                ],
              ),
              () {},
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RECALCULER')
        ],
      ),
    );
  }
}
