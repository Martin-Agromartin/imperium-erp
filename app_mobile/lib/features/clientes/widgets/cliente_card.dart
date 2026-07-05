import 'package:flutter/material.dart';

import '../../models/cliente_model.dart';

class ClienteCard extends StatelessWidget {
  final Cliente cliente;

  final VoidCallback? onTap;
  final VoidCallback? onEditar;
  final VoidCallback? onEliminar;
  final VoidCallback? onWhatsapp;
  final VoidCallback? onLlamar;

  const ClienteCard({
    super.key,
    required this.cliente,
    this.onTap,
    this.onEditar,
    this.onEliminar,
    this.onWhatsapp,
    this.onLlamar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(radius: 24, child: Icon(Icons.person)),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cliente.nombre,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        Text(cliente.localidad),
                      ],
                    ),
                  ),

                  if (cliente.activo)
                    const Icon(Icons.verified, color: Colors.green),
                ],
              ),

              const Divider(height: 30),

              Row(
                children: [
                  const Icon(Icons.phone),

                  const SizedBox(width: 8),

                  Text(cliente.telefono),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  const Icon(Icons.location_on),

                  const SizedBox(width: 8),

                  Expanded(child: Text(cliente.direccion)),
                ],
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(child: _dato("20L", cliente.envases20.toString())),

                  Expanded(child: _dato("12L", cliente.envases12.toString())),

                  Expanded(
                    child: _dato(
                      "Saldo",
                      "\$${cliente.saldo.toStringAsFixed(0)}",
                    ),
                  ),
                ],
              ),

              const Divider(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.phone),
                    onPressed: onLlamar,
                  ),

                  IconButton(
                    icon: const Icon(Icons.chat),
                    onPressed: onWhatsapp,
                  ),

                  IconButton(icon: const Icon(Icons.edit), onPressed: onEditar),

                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: onEliminar,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dato(String titulo, String valor) {
    return Column(
      children: [
        Text(titulo, style: const TextStyle(color: Colors.grey)),

        const SizedBox(height: 5),

        Text(valor, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
