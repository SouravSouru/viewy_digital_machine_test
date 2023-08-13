import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

class FadeOutAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeOutAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<double>(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: Duration(milliseconds: 500),
      tween: Tween(begin: 1.0, end: 0.0),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }
}
