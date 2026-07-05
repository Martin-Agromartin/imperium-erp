import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Imperium ERP")),

      body: const Center(
        child: Text("Dashboard v0.4.0", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
