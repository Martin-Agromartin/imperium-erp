import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/cliente_card.dart';
import '../providers/cliente_provider.dart';
import '../widgets/clientes_search_bar.dart';

class ClientesPage extends ConsumerStatefulWidget {
  const ClientesPage({super.key});

  @override
  ConsumerState<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends ConsumerState<ClientesPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(clienteControllerProvider).cargarClientes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(clienteControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Clientes")),

      body: controller.state.loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                ClientesSearchBar(onChanged: controller.buscar),

                Expanded(
                  child: ListView.builder(
                    itemCount: controller.state.clientes.length,

                    itemBuilder: (context, index) {
                      final cliente = controller.state.clientes[index];

                      return ClienteCard(
                        cliente: cliente,

                        onTap: () {},

                        onEditar: () {},

                        onEliminar: () {},

                        onWhatsapp: () {},

                        onLlamar: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
