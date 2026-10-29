import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class TagChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color? color;

  const TagChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = color ?? AppColors.violetPrimary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? accent.withAlpha(isDark ? 55 : 30)
              : (isDark ? AppColors.navySurfaceDark : Colors.grey.shade100),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? accent
                : (isDark ? AppColors.navyBorderDark : AppColors.lightBorder),
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected
                ? (isDark ? AppColors.textWhite : accent)
                : (isDark ? AppColors.textMuted : AppColors.lightTextSecondary),
          ),
        ),
      ),
    );
  }
}
