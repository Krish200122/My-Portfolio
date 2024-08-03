import 'package:flutter/material.dart';

class Measures {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

 static  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}