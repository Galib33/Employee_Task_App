import 'package:flutter/material.dart';

extension CalculateSize on num {
  ch(BuildContext context) {
    return (this * MediaQuery.of(context).size.height) / 926;
  }

  cw(BuildContext context) {
    return (this * MediaQuery.of(context).size.width) / 428;
  }

  
}
