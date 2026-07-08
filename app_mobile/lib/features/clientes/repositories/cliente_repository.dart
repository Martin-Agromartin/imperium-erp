import '../models/cliente_model.dart';

abstract class ClienteRepository {
  Future<List<Cliente>> obtenerClientes();

  Future<Cliente?> obtenerCliente(String id);

  Future<void> agregarCliente(Cliente cliente);

  Future<void> actualizarCliente(Cliente cliente);

  Future<void> eliminarCliente(String id);
}
