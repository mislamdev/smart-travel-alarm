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
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xFF082257), // from XML
            Color(0xFF0B0024), // from XML
          ],
        ),
      ),
      child: useSafeArea ? SafeArea(child: child) : child,
    );
  }
}
