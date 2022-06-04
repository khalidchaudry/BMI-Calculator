import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
              children: const [
                ReuseableCardWidget(
                  color: Color(0xFF1D1E33),
                ),
                ReuseableCardWidget(
                  color: Color(0xFF1D1E33),
                ),
              ],
            ),
          ),
          const ReuseableCardWidget(
            color: Color(0xFF1D1E33),
          ),
          Expanded(
            child: Row(
              children: const [
                ReuseableCardWidget(
                  color: Color(0xFF1D1E33),
                ),
                ReuseableCardWidget(
                  color: Color(0xFF1D1E33),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReuseableCardWidget extends StatelessWidget {
  const ReuseableCardWidget({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
