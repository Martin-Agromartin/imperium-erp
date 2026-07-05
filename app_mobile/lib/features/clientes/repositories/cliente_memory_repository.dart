import '../models/cliente_model.dart';
import 'cliente_repository.dart';
import '../data/mock_clientes.dart';

class ClienteMemoryRepository implements ClienteRepository {
  final List<Cliente> _clientes = [];

  ClienteMemoryRepository() {
    _clientes.addAll(clientesMock);
  }

  @override
  Future<void> agregarCliente(Cliente cliente) async {
    _clientes.add(cliente);
  }

  @override
  Future<void> actualizarCliente(Cliente cliente) async {
    final index = _clientes.indexWhere((e) => e.id == cliente.id);

    if (index != -1) {
      _clientes[index] = cliente;
    }
  }

  @override
  Future<void> eliminarCliente(String id) async {
    _clientes.removeWhere((e) => e.id == id);
  }

  @override
  Future<Cliente?> obtenerCliente(String id) async {
    try {
      return _clientes.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Cliente>> obtenerClientes() async {
    return List.unmodifiable(_clientes);
  }

  // ==========================
  // NUEVOS MÉTODOS
  // ==========================

  Future<List<Cliente>> buscarClientes(String texto) async {
    if (texto.trim().isEmpty) {
      return List.unmodifiable(_clientes);
    }

    final busqueda = texto.toLowerCase();

    return _clientes.where((cliente) {
      return cliente.nombre.toLowerCase().contains(busqueda) ||
          cliente.localidad.toLowerCase().contains(busqueda) ||
          cliente.telefono.contains(busqueda);
    }).toList();
  }

  Future<List<Cliente>> clientesConSaldo() async {
    return _clientes.where((c) => c.saldo > 0).toList();
  }

  Future<List<Cliente>> clientesActivos() async {
    return _clientes.where((c) => c.activo).toList();
  }
}
