import 'package:flutter/material.dart';

class ImperiumCard extends StatelessWidget {
  final Widget child;

  const ImperiumCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(padding: const EdgeInsets.all(16), child: child),
    );
  }
}
