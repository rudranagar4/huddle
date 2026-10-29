import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class HuddleCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Border? border;
  final double borderRadius;
  final Gradient? gradient;
  final bool isGlass;

  const HuddleCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.backgroundColor,
    this.border,
    this.borderRadius = 22.0,
    this.gradient,
    this.isGlass = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final defaultBg = isDark
        ? (isGlass ? AppColors.navyCardDark : AppColors.navySurfaceDark)
        : (isGlass ? AppColors.glassCardLight : Colors.white);

    final defaultBorder = Border.all(
      color: isDark
          ? AppColors.navyBorderDark
          : (isGlass ? AppColors.glassBorderLight : AppColors.glassBorderSubtle),
      width: 1.2,
    );

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withAlpha(70)
                : const Color(0x0C0A2540),
            blurRadius: 22,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: isDark
                ? Colors.black.withAlpha(40)
                : Colors.white.withAlpha(180),
            blurRadius: 1,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            decoration: BoxDecoration(
              color: gradient == null ? (backgroundColor ?? defaultBg) : null,
              gradient: gradient,
              borderRadius: BorderRadius.circular(borderRadius),
              border: border ?? defaultBorder,
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(borderRadius),
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(borderRadius),
                child: Padding(
                  padding: padding ?? const EdgeInsets.all(16.0),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
