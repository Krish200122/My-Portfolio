import 'package:flutter/material.dart';

class Measures {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double isInView(GlobalKey key, BuildContext context) {
    if (key.currentContext == null) return 0.0;

    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero).dy;
    final screenHeight = MediaQuery.of(context).size.height;

    double visibilityStart = screenHeight * 0.5;
    double visibilityEnd = screenHeight * 0.7;

    if (position > visibilityEnd) {
      return 0.0;
    } else if (position < visibilityStart) {
      return 1.0;
    } else {
      return 1.0 -
          ((position - visibilityStart) / (visibilityEnd - visibilityStart));
    }
  }
}

class PentagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double w = size.width;
    double h = size.height;

    path.moveTo(w * 0.5, 0);
    path.lineTo(w, h * 0.38);
    path.lineTo(w * 0.81, h);
    path.lineTo(w * 0.19, h);
    path.lineTo(0, h * 0.38);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
