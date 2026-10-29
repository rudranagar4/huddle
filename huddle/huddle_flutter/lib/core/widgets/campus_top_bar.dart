import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/huddle_service.dart';
import '../theme/app_colors.dart';
import '../../screens/notifications/notifications_screen.dart';

class CampusTopBar extends StatelessWidget {
  final VoidCallback? onAvatarTap;

  const CampusTopBar({super.key, this.onAvatarTap});

  @override
  Widget build(BuildContext context) {
    final student = HuddleService.instance.currentStudent;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          // HUDDLE Brand Squircle Logo
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.cyanBrand.withAlpha(120), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: AppColors.cyanBrand.withAlpha(60),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [AppColors.cyanBrand, AppColors.mintSuccess],
                ).createShader(bounds),
                child: const Text(
                  'H',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),

          // College & Batch Frosted Pill
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white.withAlpha(15)
                      : Colors.white.withAlpha(180),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderLight,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: AppColors.cyanBrand,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.cyanBrand,
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${student.college} • Batch \'26',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: isDark ? AppColors.textWhite : AppColors.textDarkBody,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const Spacer(),

          // Notification Bell with Badge
          ValueListenableBuilder<int>(
            valueListenable: HuddleService.instance.unreadNotificationsCount,
            builder: (context, count, _) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.navyCardDark
                          : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderLight,
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(10),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.notifications_none_rounded, size: 20),
                      color: isDark ? AppColors.textWhite : AppColors.textDarkBody,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationsScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  if (count > 0)
                    Positioned(
                      top: -2,
                      right: -2,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppColors.cyanBrand,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                        child: Center(
                          child: Text(
                            '$count',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(width: 10),

          // Rudra's Male Profile Avatar with Status Ring
          GestureDetector(
            onTap: onAvatarTap,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.cyanBrand, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.cyanBrand.withAlpha(50),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 17,
                backgroundColor: AppColors.cyanPillBg,
                backgroundImage: NetworkImage(student.avatarUrl ?? ''),
                onBackgroundImageError: (_, _) {},
                child: student.avatarUrl == null
                    ? const Icon(Icons.person, color: AppColors.cyanDark, size: 18)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
