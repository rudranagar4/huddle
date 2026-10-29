import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'huddle_button.dart';

class LoadingSkeleton extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;

  const LoadingSkeleton({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.borderRadius = 12.0,
  });

  @override
  State<LoadingSkeleton> createState() => _LoadingSkeletonState();
}

class _LoadingSkeletonState extends State<LoadingSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.35, end: 0.85).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? AppColors.navyCardDark : Colors.grey.shade200;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: baseColor.withAlpha((_animation.value * 255).toInt()),
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: (isDark ? AppColors.navyBorderDark : Colors.grey.shade300).withAlpha(100),
              width: 1,
            ),
          ),
        );
      },
    );
  }
}

class EmptyStateView extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? actionText;
  final VoidCallback? onAction;

  const EmptyStateView({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: AppColors.violetPrimary.withAlpha(isDark ? 35 : 20),
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.violetPrimary.withAlpha(70)),
              ),
              child: Icon(icon, size: 42, color: AppColors.violetPrimary),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (actionText != null && onAction != null) ...[
              const SizedBox(height: 24),
              HuddleButton(
                text: actionText!,
                onPressed: onAction,
                variant: HuddleButtonVariant.primary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ErrorStateView extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onRetry;

  const ErrorStateView({
    super.key,
    this.title = 'Oops! Something went wrong',
    this.message = 'Unable to reach the server. Please check your network or try again.',
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.coral.withAlpha(30),
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.coral.withAlpha(80)),
              ),
              child: const Icon(Icons.cloud_off_rounded, size: 38, color: AppColors.coral),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            HuddleButton(
              text: 'Retry Now',
              icon: Icons.refresh_rounded,
              onPressed: onRetry,
              variant: HuddleButtonVariant.primary,
              customColor: AppColors.coral,
            ),
          ],
        ),
      ),
    );
  }
}
