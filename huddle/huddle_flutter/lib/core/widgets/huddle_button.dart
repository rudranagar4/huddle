import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

enum HuddleButtonVariant { primary, secondary, outline, text }

class HuddleButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final HuddleButtonVariant variant;
  final bool isLoading;
  final double? width;
  final double height;
  final Color? customColor;

  const HuddleButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.variant = HuddleButtonVariant.primary,
    this.isLoading = false,
    this.width,
    this.height = 48.0,
    this.customColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (variant == HuddleButtonVariant.primary) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: customColor == null ? AppColors.primaryGradient : null,
          color: customColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: (customColor ?? AppColors.violetPrimary).withAlpha(80),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isLoading ? null : onPressed,
            borderRadius: BorderRadius.circular(12),
            child: Center(
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (icon != null) ...[
                          Icon(icon, color: Colors.white, size: 18),
                          const SizedBox(width: 8),
                        ],
                        Text(
                          text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      );
    }

    if (variant == HuddleButtonVariant.outline) {
      return SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: customColor ?? (isDark ? AppColors.navyBorderDark : AppColors.lightBorder)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: isDark ? AppColors.navySurfaceDark.withAlpha(80) : Colors.transparent,
          ),
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      Icon(icon, size: 18, color: customColor ?? (isDark ? Colors.white : AppColors.lightTextPrimary)),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: customColor ?? (isDark ? Colors.white : AppColors.lightTextPrimary),
                      ),
                    ),
                  ],
                ),
        ),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: customColor ?? AppColors.violetPrimary),
              const SizedBox(width: 6),
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: customColor ?? AppColors.violetPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
