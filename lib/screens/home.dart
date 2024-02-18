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

//#### functions
  void calculate() {
    if (num1.isEmpty || operand.isEmpty || num2.isEmpty) return;

    double numA = double.parse(num1);
    double numB = double.parse(num2);
    var result = 0.0;

    switch (operand) {
      case Btn.add:
        result = numA + numB;
        break;
      case Btn.mul:
        result = numA * numB;
        break;
      case Btn.sub:
        result = numA - numB;
        break;
      case Btn.div:
        result = numA / numB;
        break;
      default:
    }
    setState(() {
      num2 = '';
      operand = '';
      num1 = result.toString();
    });
  }

  void percentage() {
    if (num1.isNotEmpty && operand.isEmpty && num2.isNotEmpty) {
      // TODO calc percentage
      // final res = num1 operand num2;
      // num1 = res;
      // debugPrint('percent');
    }
    if (operand.isNotEmpty) return;
    final numA = double.parse(num1);
    setState(() {
      num1 = "${(numA / 100)}";
      operand = '';
      num2 = '';
    });
  }

  void delete() {
    if (num2.isNotEmpty) {
      num2 = num2.substring(0, num2.length - 1);
    }
    if (num1.isNotEmpty) {
      num1 = num1.substring(0, num1.length - 1);
    }
    setState(() {});
  }

  void clear() {
    setState(() {
      num1 = '';
      operand = '';
      num2 = '';
    });
  }

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
    if (num1.isEmpty && value == Btn.per) return;
    if (value == Btn.del) {
      delete();
      return;
    }
    if (value == Btn.clr) {
      clear();
      return;
    }
    if (value == Btn.per) {
      percentage();
      return;
    }
    if (value == Btn.calc) {
      calculate();
      return;
    }
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
