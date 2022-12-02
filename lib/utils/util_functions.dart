import 'package:flutter/material.dart';

class UtilFunctions {
  static void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static void navigateback(BuildContext context) {
    Navigator.of(context).pop();
  }
}
