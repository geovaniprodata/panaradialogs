import 'package:flutter/material.dart';

class ButtonData {
  VoidCallback? callback;
  String? buttonText;
  Color? buttonColor;
  Color? textColor;

  ButtonData({
    this.callback,
    this.buttonText,
    this.buttonColor,
    this.textColor,
  });
}
