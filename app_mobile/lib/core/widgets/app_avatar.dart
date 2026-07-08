import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  final String text;

  const AppAvatar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(child: Text(text.substring(0, 1).toUpperCase()));
  }
}
