import 'package:flutter/material.dart';

import '../../models/cliente_model.dart';

class ClienteCard extends StatelessWidget {
  final Cliente cliente;

  const ClienteCard({
    super.key,
    required this.cliente,
  });

  @override
  Widget build(BuildContext context) {

    final colorSaldo =
        cliente.saldo > 0 ? Colors.red : Colors.green;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(cliente.nombre[0]),
        ),
        title: Text(cliente.nombre),
        subtitle: Text(cliente.localidad),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "\$${cliente.saldo.toStringAsFixed(0)}",
              style: TextStyle(
                color: colorSaldo,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "${cliente.envases20} x20L",
            ),

          ],
        ),
      ),
    );
  }
}