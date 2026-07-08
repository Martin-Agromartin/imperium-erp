import 'package:flutter/material.dart';

class ImperiumLogo extends StatelessWidget {
  final double size;

  const ImperiumLogo({super.key, this.size = 120});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo/logo.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.water_drop, size: size, color: Colors.blue.shade900);
      },
    );
  }
}
