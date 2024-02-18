import 'package:flutter/material.dart';

import 'constants/btn_values.dart';
import 'constants/style.dart';

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
      onPressed: () {},
      child: Text(
        value,
        style: inputTextStyle,
      ),
    ),
  );
}


