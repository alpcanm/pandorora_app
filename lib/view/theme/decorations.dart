import 'package:flutter/material.dart';

class Decorations {
  static InputDecoration inputDecoration(
      BuildContext context, String labelText ,{String? helperText}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.blueGrey),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      helperText: helperText,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    );
  }
}
