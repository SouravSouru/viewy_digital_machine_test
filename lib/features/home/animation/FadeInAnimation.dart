import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

class FadeInAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeInAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<double>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0.0, end: 1.0),
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
