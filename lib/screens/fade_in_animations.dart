import 'package:flutter/material.dart';

class FadeInAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const FadeInAnimation(
      {super.key, required this.child, this.duration = const Duration(seconds: 1)});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: duration,
      builder: (context, double opacity, child) {
        return Opacity(opacity: opacity, child: child);
      },
      child: child,
    );
  }
}
