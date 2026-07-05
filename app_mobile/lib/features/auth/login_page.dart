import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/widgets/imperium_button.dart';
import '../../app/widgets/imperium_logo.dart';
import '../../app/widgets/imperium_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usuarioController = TextEditingController();
  final passwordController = TextEditingController();

  bool recordar = false;
  bool ocultarPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,

            end: Alignment.bottomCenter,

            colors: [Color(0xff0B1F3A), Color(0xff163D70)],
          ),
        ),

        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25),

              child: Card(
                elevation: 10,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(30),

                  child: Column(
                    children: [
                      const ImperiumLogo(size: 110),

                      const SizedBox(height: 25),

                      const Text(
                        "Bienvenido",

                        style: TextStyle(
                          fontSize: 30,

                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Sistema de Gestión de Reparto",

                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 35),

                      ImperiumTextField(
                        controller: usuarioController,

                        label: "Usuario",

                        icon: Icons.person,
                      ),

                      const SizedBox(height: 20),

                      TextField(
                        controller: passwordController,

                        obscureText: ocultarPassword,

                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),

                          labelText: "Contraseña",

                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                ocultarPassword = !ocultarPassword;
                              });
                            },

                            icon: Icon(
                              ocultarPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      CheckboxListTile(
                        value: recordar,

                        contentPadding: EdgeInsets.zero,

                        title: const Text("Recordarme"),

                        controlAffinity: ListTileControlAffinity.leading,

                        onChanged: (valor) {
                          setState(() {
                            recordar = valor!;
                          });
                        },
                      ),

                      const SizedBox(height: 10),

                      ImperiumButton(
                        text: "INGRESAR",

                        icon: Icons.login,

                        onPressed: () {
                          context.go("/dashboard");
                        },
                      ),

                      const SizedBox(height: 20),

                      TextButton(
                        onPressed: () {},

                        child: const Text("¿Olvidaste tu contraseña?"),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "Versión 1.0.0",

                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
