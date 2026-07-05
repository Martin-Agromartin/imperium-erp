import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/cliente_memory_repository.dart';
import '../controllers/cliente_controller.dart';

final clienteControllerProvider = ChangeNotifierProvider<ClienteController>((
  ref,
) {
  return ClienteController(ClienteMemoryRepository());
});
