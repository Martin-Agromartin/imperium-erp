import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const AppSearchBar({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: "Buscar...",
      leading: const Icon(Icons.search),
      onChanged: onChanged,
    );
  }
}
