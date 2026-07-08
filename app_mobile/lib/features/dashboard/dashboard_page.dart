import 'package:flutter/material.dart';

import '../widgets/dashboard_card.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_kpi.dart';
import '../widgets/dashboard_drawer.dart';
import '../widgets/user_info_card.dart';

void SizedBox(height = 20),

void UserInfoCard(),

void SizedBox(height = 20),

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(title: const Text("Imperium ERP")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView(
          children: [
            const DashboardHeader(),

            const SizedBox(height: 25),

            const Row(
              children: [
                Expanded(
                  child: DashboardKPI(
                    titulo: "Ventas",
                    valor: "\$154.200",
                    icono: Icons.attach_money,
                  ),
                ),

                SizedBox(width: 12),

                Expanded(
                  child: DashboardKPI(
                    titulo: "Clientes",
                    valor: "214",
                    icono: Icons.people,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            GridView.count(
              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              crossAxisCount: 2,

              crossAxisSpacing: 12,

              mainAxisSpacing: 12,

              childAspectRatio: 1.15,

              children: [
                DashboardCard(
                  titulo: "Clientes",
                  icono: Icons.people,
                  onTap: () {},
                ),

                DashboardCard(
                  titulo: "Pedidos",
                  icono: Icons.shopping_cart,
                  onTap: () {},
                ),

                DashboardCard(
                  titulo: "Reparto",
                  icono: Icons.local_shipping,
                  onTap: () {},
                ),

                DashboardCard(
                  titulo: "Caja",
                  icono: Icons.point_of_sale,
                  onTap: () {},
                ),

                DashboardCard(
                  titulo: "Producción",
                  icono: Icons.factory,
                  onTap: () {},
                ),

                DashboardCard(
                  titulo: "Reportes",
                  icono: Icons.bar_chart,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
