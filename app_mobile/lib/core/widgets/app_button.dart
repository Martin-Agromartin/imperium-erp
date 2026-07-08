import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

enum AppButtonType { primary, secondary, danger, success, outlined }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool loading;
  final AppButtonType type;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.loading = false,
    this.type = AppButtonType.primary,
  });

  Color _backgroundColor() {
    switch (type) {
      case AppButtonType.primary:
        return AppColors.primary;
      case AppButtonType.secondary:
        return AppColors.secondary;
      case AppButtonType.success:
        return AppColors.success;
      case AppButtonType.danger:
        return AppColors.danger;
      case AppButtonType.outlined:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: loading ? null : onPressed,
        icon: loading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: _backgroundColor(),
          foregroundColor: type == AppButtonType.outlined
              ? AppColors.primary
              : Colors.white,
          elevation: 0,
        ),
      ),
    );
  }
}
