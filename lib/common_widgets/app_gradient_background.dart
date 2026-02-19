import 'package:flutter/material.dart';

class AppGradientBackground extends StatelessWidget {
  final Widget child;
  final bool useSafeArea;

  const AppGradientBackground({
    super.key,
    required this.child,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter, // 360deg = bottom to top
          end: Alignment.topCenter,
          colors: [
            Color(0xFF082257), // 0% - Bottom color
            Color(0xFF0B0024), // 100% - Top color
          ],
          stops: [0.0, 0.4], // Full gradient from 0% to 100%
        ),
      ),
      child: useSafeArea ? SafeArea(child: child) : child,
    );
  }
}
