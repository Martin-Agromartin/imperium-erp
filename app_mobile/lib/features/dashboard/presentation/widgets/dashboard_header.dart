import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        Row(
          children: [
            const CircleAvatar(radius: 28, child: Icon(Icons.water_drop)),

            const SizedBox(width: 15),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Imperium ERP",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                Text("Bienvenido Martín"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
