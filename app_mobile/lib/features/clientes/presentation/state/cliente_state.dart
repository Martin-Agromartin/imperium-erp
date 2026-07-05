class ClienteState {
  final bool loading;
  final List<Cliente> clientes;
  final String? error;

  const ClienteState({
    this.loading = false,
    this.clientes = const [],
    this.error,
  });

  ClienteState copyWith({
    bool? loading,
    List<Cliente>? clientes,
    String? error,
  }) {
    return ClienteState(
      loading: loading ?? this.loading,
      clientes: clientes ?? this.clientes,
      error: error ?? this.error,
    );
  }
}
