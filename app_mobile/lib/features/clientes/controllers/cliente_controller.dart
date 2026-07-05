import 'package:flutter/material.dart';

import '../../models/cliente_model.dart';
import '../../repositories/cliente_repository.dart';
import '../state/cliente_state.dart';

class ClienteController extends ChangeNotifier {
  final ClienteRepository repository;
  List<Cliente> _todosLosClientes = [];

  ClienteController(this.repository);

  ClienteState _state = const ClienteState();

  ClienteState get state => _state;

  Future<void> cargarClientes() async {
    _state = _state.copyWith(loading: true);
    notifyListeners();

    final lista = await repository.obtenerClientes();

    _todosLosClientes = lista;

    _state = _state.copyWith(clientes: lista, loading: false);

    notifyListeners();
  }

  Future<void> agregarCliente(Cliente cliente) async {
    await repository.agregarCliente(cliente);

    await cargarClientes();
  }

  Future<void> eliminarCliente(String id) async {
    await repository.eliminarCliente(id);

    await cargarClientes();
  }

  Future<void> actualizarCliente(Cliente cliente) async {
    await repository.actualizarCliente(cliente);

    await cargarClientes();
  }

  void buscar(String texto) {
    if (texto.isEmpty) {
      _state = _state.copyWith(clientes: _todosLosClientes);

      notifyListeners();

      return;
    }

    final busqueda = texto.toLowerCase();

    final filtrados = _todosLosClientes.where((cliente) {
      return cliente.nombre.toLowerCase().contains(busqueda) ||
          cliente.telefono.contains(busqueda) ||
          cliente.localidad.toLowerCase().contains(busqueda);
    }).toList();

    _state = _state.copyWith(clientes: filtrados);

    notifyListeners();
  }
}
