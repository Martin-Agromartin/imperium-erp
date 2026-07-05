import '../forms/cliente_form.dart';

class ClienteForm extends StatelessWidget {
  const ClienteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nuevo Cliente")),

      body: const Center(child: Text("Formulario Cliente")),
    );
  }
}
