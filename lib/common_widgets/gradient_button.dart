import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool outlined;
  final IconData? icon;
  final bool iconOnRight;

  const GradientButton({
    super.key,
    required this.text,
    required this.onTap,
    this.outlined = false,
    this.icon,
    this.iconOnRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: outlined
              ? null
              : const LinearGradient(
                  colors: [Color(0xFF6A00FF), Color(0xFF9C00FF)],
                ),
          border: outlined
              ? Border.all(color: Colors.white.withValues(alpha: 0.4))
              : null,
        ),
        alignment: Alignment.center,
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: iconOnRight
                    ? [
                        Text(
                          text,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          icon,
                          color: Colors.white,
                          size: 22,
                        ),
                      ]
                    : [
                        Icon(
                          icon,
                          color: Colors.white,
                          size: 22,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          text,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
      ),
    );
  }
}
