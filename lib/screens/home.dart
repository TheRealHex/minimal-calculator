import 'package:flutter/material.dart';
import 'package:minimal_calculator/constants/btn_values.dart';

import '../constants/style.dart';
import '../functions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String num1 = '', operand = '', num2 = '';
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // For result
            Expanded(
              child: SingleChildScrollView(
                reverse:
                    true, // for reverse scrolling the output of calculation
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    // display 0 if no-input else user-input
                    '$num1$operand$num2'.isEmpty ? '0' : '$num1$operand$num2',
                    style: outputTextStyle,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),

            // For user input
            Wrap(
              children: Btn.btnValues
                  .map(
                    (value) => SizedBox(
                      width:
                          value == Btn.calc // calculate button width increase
                              ? screenSize.width / 2
                              : screenSize.width / 4,
                      height: screenSize.width / 5, // half of the screen width
                      child: buildBtn(value),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

//#### functions
}
