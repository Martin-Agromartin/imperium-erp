import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

class ImperiumApp extends StatelessWidget {
  const ImperiumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imperium ERP',

      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      home: Scaffold(
        appBar: AppBar(title: const Text("Imperium ERP")),

        body: const Center(
          child: Text(
            "Sistema de Gestión",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
