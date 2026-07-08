import 'package:flutter/material.dart';

class ClienteSearchBar extends StatelessWidget {
  const ClienteSearchBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        decoration: InputDecoration(

          hintText: "Buscar cliente",

          prefixIcon: const Icon(Icons.search),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}