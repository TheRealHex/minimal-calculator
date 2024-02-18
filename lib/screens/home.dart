import 'package:flutter/material.dart';
import 'package:minimal_calculator/constants/btn_values.dart';

import '../constants/style.dart';

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

// void calculate() {}
// void percentage() {}
// void delete() {}
// void clear() {}

//#### functions
  void appendValue(String value) {
    // If value is only operand & not dot
    if (value != Btn.dot && int.tryParse(value) == null) {
      operand = value;
    }
    // for num1
    else if (num1.isEmpty || operand.isEmpty) {
      // check value is dot (1.4, 1.45)
      if (value == Btn.dot && num1.contains(Btn.dot)) return;
      // put 0. if dot is pressed at first
      if (value == Btn.dot && (num1.isEmpty || num1 == Btn.dot)) {
        value = '0.';
      }
      num1 += value;
    }
    // for num2
    else if (num2.isEmpty || operand.isNotEmpty) {
      // check value is dot (1.4, 1.45)
      if (value == Btn.dot && num2.contains(Btn.dot)) return;
      // put 0. if dot is pressed at first
      if (value == Btn.dot && (num2.isEmpty || num2 == Btn.dot)) {
        value = '0.';
      }
      num2 += value;
    }

    setState(() {});
  }

  // on button press
  void onBtnTap(String value) {
    appendValue(value); // to append input at the end
  }

// Function to build button
  Widget buildBtn(value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: [Btn.del, Btn.clr, Btn.calc].contains(value)
                ? Colors.redAccent
                : [Btn.per, Btn.mul, Btn.div, Btn.add, Btn.sub].contains(value)
                    ? Colors.red
                    : null),
        onPressed: () => onBtnTap(value),
        child: Text(
          value,
          style: inputTextStyle,
        ),
      ),
    );
  }
}
