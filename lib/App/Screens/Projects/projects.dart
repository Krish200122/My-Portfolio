import 'package:flutter/material.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';

class projects extends StatelessWidget {
  const projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Variables.key2,
      height: Measures.getHeight(context) * 0.3,
      width: Measures.getWidth(context) * 0.65,
      child: Row(
        children: [],
      ),
    );
  }
}
