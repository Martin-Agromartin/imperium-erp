import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final VoidCallback onTap;

  const DashboardTile({
    super.key,

    required this.icon,

    required this.titulo,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),

      onTap: onTap,

      child: Card(
        elevation: 3,

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(icon, size: 42, color: const Color(0xff0B1F3A)),

              const SizedBox(height: 15),

              Text(titulo, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
