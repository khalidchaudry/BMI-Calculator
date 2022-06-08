import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card_widget.dart';
import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const CalculationScreen(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation})
      : super(key: key);

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: const Color(0xFF0A0E21),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Your Results',
              style: kTitleTextStyle,
            ),
          ),
          Expanded(
              child: ReuseableCardWidget(
                  color: activeCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.resultText.toUpperCase(),
                          style: kResultTextStyle),
                      Text(widget.bmiResult, style: kBMITextStyle),
                      Text(widget.interpretation,
                          textAlign: TextAlign.center, style: kDescTextStyle),
                    ],
                  ),
                  press: () {})),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              height: 70,
              color: const Color(0xFFEB1555),
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                'RE-CALCULATE',
                style: textstyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
