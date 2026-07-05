import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/cliente_controller.dart';
import '../widgets/cliente_card.dart';
import '../widgets/cliente_search_bar.dart';

class ClientesPage extends ConsumerWidget {
  const ClientesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clienteControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Clientes")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(clienteControllerProvider.notifier).cargarClientes();
        },
        child: Column(
          children: [
            const ClienteSearchBar(),

            Expanded(
              child: Builder(
                builder: (_) {
                  if (state.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.clientes.isEmpty) {
                    return const Center(child: Text("No existen clientes."));
                  }

                  return ListView.builder(
                    itemCount: state.clientes.length,
                    itemBuilder: (_, index) {
                      return ClienteCard(cliente: state.clientes[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
