import 'package:flutter/material.dart';

class ClientesSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const ClientesSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),

      child: TextField(
        onChanged: onChanged,

        decoration: InputDecoration(
          hintText: "Buscar cliente...",

          prefixIcon: const Icon(Icons.search),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}
