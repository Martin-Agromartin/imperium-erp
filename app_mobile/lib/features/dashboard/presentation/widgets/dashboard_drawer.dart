import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Martín"),
            accountEmail: Text("Administrador"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person, size: 40),
            ),
          ),

          _item(context, Icons.dashboard, "Dashboard", "/dashboard"),

          _item(context, Icons.people, "Clientes", "/clientes"),

          _item(context, Icons.inventory_2, "Productos", "/productos"),

          _item(context, Icons.shopping_cart, "Pedidos", "/pedidos"),

          _item(context, Icons.local_shipping, "Reparto", "/reparto"),

          _item(context, Icons.factory, "Producción", "/produccion"),

          _item(context, Icons.point_of_sale, "Caja", "/caja"),

          _item(context, Icons.bar_chart, "Reportes", "/reportes"),

          const Spacer(),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Cerrar sesión"),
            onTap: () {
              context.go("/login");
            },
          ),
        ],
      ),
    );
  }

  Widget _item(
    BuildContext context,
    IconData icon,
    String title,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        context.go(route);
      },
    );
  }
}
