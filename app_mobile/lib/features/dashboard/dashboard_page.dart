import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/app_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = const [
      _DashboardItem('Clientes', Icons.people_alt_outlined, '128 activos'),
      _DashboardItem('Ventas', Icons.point_of_sale_outlined, '24 de hoy'),
      _DashboardItem('Stock', Icons.inventory_2_outlined, '8 alertas'),
      _DashboardItem('Reportes', Icons.bar_chart_outlined, 'Actualizado'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Imperium ERP')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(
            'Panel principal',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          const Text(
            'Resumen operativo',
            style: TextStyle(color: AppColors.mutedText),
          ),
          const SizedBox(height: AppSpacing.lg),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth > 700 ? 4 : 2;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: AppSpacing.md,
                  mainAxisSpacing: AppSpacing.md,
                  childAspectRatio: 1.25,
                ),
                itemBuilder: (context, index) => _DashboardTile(items[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DashboardItem {
  const _DashboardItem(this.title, this.icon, this.subtitle);

  final String title;
  final IconData icon;
  final String subtitle;
}

class _DashboardTile extends StatelessWidget {
  const _DashboardTile(this.item);

  final _DashboardItem item;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(item.icon, color: AppColors.primary, size: 30),
          const Spacer(),
          Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            item.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }
}
