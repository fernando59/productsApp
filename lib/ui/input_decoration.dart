import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hinText,
    required String labelText,
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.deepPurple)),
      focusedBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
      hintText: hinText,
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.grey),
    );
  }
}
