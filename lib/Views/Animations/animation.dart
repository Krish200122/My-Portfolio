import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomAnimation extends StatelessWidget {
  final int index;
  final Duration duration;
  final Widget child;
  final double? horizontalOffset;
  final double? verticalOffset;

  // ignore: prefer_const_constructors_in_immutables
  CustomAnimation({
    required this.index,
    required this.duration,
    required this.child,
    this.horizontalOffset,
    this.verticalOffset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: duration,
      child: SlideAnimation(
        horizontalOffset: horizontalOffset ?? 0.0,
        verticalOffset: verticalOffset ?? 0.0,
        child: FadeInAnimation(child: child),
      ),
    );
  }
}
