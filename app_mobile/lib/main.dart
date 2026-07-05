import 'package:flutter/material.dart';
import 'package:imperium_erp/app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // En próximas versiones inicializaremos Firebase aquí.
  // await Firebase.initializeApp();

  runApp(ProviderScope(child: const ImperiumApp()));
}
