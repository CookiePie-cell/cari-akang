import 'package:flutter/cupertino.dart';

class Helper {
  const Helper();

  static double getAdaptiveText(BuildContext context, dynamic value) {
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}
