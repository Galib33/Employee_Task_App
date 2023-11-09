import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  goPushReplacement(Widget route) {
    Navigator.pushReplacement(
        this,
        MaterialPageRoute(
          builder: (_) => route,
        ));
  }

  goBack() {
    Navigator.pop(this);
  }
}
