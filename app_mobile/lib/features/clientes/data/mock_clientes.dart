import '../models/cliente_model.dart';

final clientesMock = [
  Cliente(
    id: "1",

    nombre: "Juan Pérez",

    telefono: "1155551111",

    direccion: "Calle 123",

    localidad: "Berazategui",

    provincia: "Buenos Aires",

    zona: "Zona Sur",

    fechaAlta: DateTime.now(),
  ),

  Cliente(
    id: "2",

    nombre: "María Gómez",

    telefono: "1144442222",

    direccion: "Av. Mitre",

    localidad: "Quilmes",

    provincia: "Buenos Aires",

    zona: "Zona Sur",

    fechaAlta: DateTime.now(),
  ),
];
