class ClienteModel {
  final String id;

  final String nombre;

  final String telefono;

  final String email;

  final String direccion;

  final String localidad;

  final double saldo;

  final int envases20;

  final int envases12;

  final bool activo;

  final String observaciones;

  const ClienteModel({
    required this.id,
    required this.nombre,
    required this.telefono,
    required this.email,
    required this.direccion,
    required this.localidad,
    required this.saldo,
    required this.envases20,
    required this.envases12,
    required this.activo,
    required this.observaciones,
  });
}
