import 'package:flutter/material.dart';
import 'package:true_or_false/components/bmi_brain.dart';
import 'package:true_or_false/screens/results.dart';

import 'package:true_or_false/widget/Reusable_Card.dart';
import 'package:true_or_false/widget/bottom_button.dart';
import 'package:true_or_false/widget/custom_circle_button.dart';
import 'package:true_or_false/widget/icon_Content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

enum Gender {
  male,
  female,
  neutre,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender selectGender = Gender.neutre;
  int height = 180;
  int weight = 60;
  int age = 25;

  Widget customColumn(
    String label,
    int type,
    int typeMinus,
    int typeplus,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: kTextStyle,
        ),
        Text(
          type.toString(),
          style: kNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              FontAwesomeIcons.minus,
              () {
                setState(() {
                  typeMinus--;
                });
              },
            ),
            const SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              FontAwesomeIcons.plus,
              () {
                setState(() {
                  typeplus++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text('BMI Master'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    selectGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    IconContent(
                      FontAwesomeIcons.mars,
                      'Homme',
                    ),
                    () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    selectGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    IconContent(
                      FontAwesomeIcons.venus,
                      'Femme',
                    ),
                    () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              kActiveCardColour,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(height : 4.0,),
                  const Text(
                    'TAILLE',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      const Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: kBottomContainerColour,
                      overlayColor: const Color(0x29EB1555),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    kActiveCardColour,
                    Column(
                      children: [
                        const Text(
                          'POIDS',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              FontAwesomeIcons.minus,
                              () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              FontAwesomeIcons.plus,
                              () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    kActiveCardColour,
                    customColumn(
                      'AGE',
                      age,
                      age,
                      age,
                    ),
                    () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              // CalculatorBrain calc = CalculatorBrain(
              //   height: height,
              //   weight: weight,
              // );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                      // bmiResult: calc.calculateBMI(),
                      // resultText: calc.calculateBMI(),
                      // interpretation: calc.calculateBMI(),
                      ),
                ),
              );
            },
            buttonTitle: 'CALCULER',
          ),
        ],
      ),
    );
  }
}
