import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';
import '../widgets/dashboard_drawer.dart';
import '../widgets/user_info_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kpis = const [
      DashboardKpiData(
        title: 'Clientes',
        value: '128',
        detail: 'activos',
        icon: Icons.people_alt_outlined,
        color: AppColors.primary,
      ),
      DashboardKpiData(
        title: 'Ventas',
        value: '24',
        detail: 'de hoy',
        icon: Icons.point_of_sale_outlined,
        color: AppColors.success,
      ),
      DashboardKpiData(
        title: 'Stock',
        value: '8',
        detail: 'alertas',
        icon: Icons.inventory_2_outlined,
        color: AppColors.warning,
      ),
      DashboardKpiData(
        title: 'Reportes',
        value: 'OK',
        detail: 'actualizado',
        icon: Icons.bar_chart_outlined,
        color: AppColors.secondary,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Imperium ERP'),
        actions: [
          IconButton(
            tooltip: 'Notificaciones',
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
          ),
        ],
      ),
      drawer: const DashboardDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          const _DashboardHeader(),
          const SizedBox(height: AppSpacing.lg),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth >= 1000
                  ? 4
                  : constraints.maxWidth >= 620
                  ? 2
                  : 1;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: kpis.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: AppSpacing.md,
                  mainAxisSpacing: AppSpacing.md,
                  mainAxisExtent: 136,
                ),
                itemBuilder: (context, index) =>
                    DashboardKpi(data: kpis[index]),
              );
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          const _ActivityPanel(),
        ],
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 760;
        final title = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Panel principal',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppSpacing.xs),
            const Text(
              'Resumen operativo',
              style: TextStyle(color: AppColors.mutedText),
            ),
          ],
        );

        if (compact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              const SizedBox(height: AppSpacing.md),
              const UserInfoCard(),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: title),
            const SizedBox(width: AppSpacing.lg),
            const SizedBox(width: 320, child: UserInfoCard()),
          ],
        );
      },
    );
  }
}

class _ActivityPanel extends StatelessWidget {
  const _ActivityPanel();

  @override
  Widget build(BuildContext context) {
    final activities = const [
      _Activity('Nueva venta registrada', 'Hace 12 minutos'),
      _Activity('Cliente actualizado', 'Hace 34 minutos'),
      _Activity('Stock bajo en 8 productos', 'Hoy'),
    ];

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Actividad reciente',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppSpacing.md),
          for (final activity in activities) ...[
            _ActivityRow(activity),
            if (activity != activities.last)
              const Divider(height: AppSpacing.lg, color: AppColors.border),
          ],
        ],
      ),
    );
  }
}

class _Activity {
  const _Activity(this.title, this.time);

  final String title;
  final String time;
}

class _ActivityRow extends StatelessWidget {
  const _ActivityRow(this.activity);

  final _Activity activity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle_outline, color: AppColors.success),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Text(
            activity.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Text(activity.time, style: const TextStyle(color: AppColors.mutedText)),
      ],
    );
  }
}
