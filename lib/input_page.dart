import 'package:bmi_calculator/calculation_screen.dart';
import 'package:bmi_calculator/models/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content_widget.dart';
import 'reusable_card_widget.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCradColor = inActiveColor;
  Color feMaleCradColor = inActiveColor;

  Gender? selectedGender;
  var height = 130;
  var weightCounter = 20;
  var ageCounter = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Calculator'),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCardWidget(
                    press: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? activeCardColor
                        : inActiveColor,
                    child: const IconContent(
                      iconData: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCardWidget(
                    press: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : inActiveColor,
                    child: const IconContent(
                      iconData: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCardWidget(
              press: () {},
              color: const Color(0xFF1D1E33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: textstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberStyle),
                      const Text('cm', style: textstyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.grey,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReuseableCardWidget(
                  press: () {},
                  color: const Color(0xFF1D1E33),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: textstyle,
                      ),
                      Text(weightCounter.toString(), style: kNumberStyle),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                            backgroundColor: const Color(0xFF4C4F5E),
                            onPressed: () {
                              setState(() {
                                weightCounter--;
                              });
                            },
                            child: const Icon(FontAwesomeIcons.minus),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weightCounter++;
                              });
                            },
                            backgroundColor: const Color(0xFF4C4F5E),
                            child: const Icon(FontAwesomeIcons.plus),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCardWidget(
                  press: () {},
                  color: const Color(0xFF1D1E33),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: textstyle,
                        ),
                        Text(ageCounter.toString(), style: kNumberStyle),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              backgroundColor: const Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  ageCounter--;
                                });
                              },
                              child: const Icon(FontAwesomeIcons.minus),
                            ),
                            FloatingActionButton(
                              backgroundColor: const Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  ageCounter++;
                                });
                              },
                              child: const Icon(FontAwesomeIcons.plus),
                            ),
                          ],
                        ),
                      ]),
                ),
              )
            ]),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weightCounter);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CalculationScreen(
                            bmiResult: calc.bmiCalculate(),
                            resultText: calc.bmiResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
            child: Container(
              alignment: Alignment.center,
              height: 70,
              color: const Color(0xFFEB1555),
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                'CALCULATE',
                style: textstyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
