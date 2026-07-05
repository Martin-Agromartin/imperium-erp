import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String titulo;
  final IconData icono;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.titulo,
    required this.icono,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(18),

      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(icono, size: 42),

              const SizedBox(height: 15),

              Text(titulo, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
