import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usuarioController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    usuarioController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 380,

            child: Padding(
              padding: const EdgeInsets.all(24),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const FlutterLogo(size: 100),

                  const SizedBox(height: 40),

                  AppTextField(
                    controller: usuarioController,
                    label: "Usuario",
                    icon: Icons.person,
                  ),

                  const SizedBox(height: 16),

                  AppTextField(
                    controller: passwordController,
                    label: "Contraseña",
                    icon: Icons.lock,
                    obscure: true,
                  ),

                  const SizedBox(height: 24),

                  AppButton(
                    text: "Ingresar",
                    icon: Icons.login,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
