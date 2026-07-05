import 'package:flutter/material.dart';

class DashboardKPI extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;

  const DashboardKPI({
    super.key,
    required this.titulo,
    required this.valor,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),

        child: Column(
          children: [
            Icon(icono, size: 40),

            const SizedBox(height: 10),

            Text(
              valor,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            Text(titulo),
          ],
        ),
      ),
    );
  }
}
