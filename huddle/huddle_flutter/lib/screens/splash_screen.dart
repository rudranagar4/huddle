import 'dart:async';
import 'package:flutter/material.dart';
import '../core/services/huddle_service.dart';
import '../core/theme/app_colors.dart';
import 'navigation_shell.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();

    Timer(const Duration(milliseconds: 2000), () {
      if (!mounted) return;
      final isLoggedIn = HuddleService.instance.isLoggedIn;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) =>
              isLoggedIn ? const NavigationShell() : const OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? null : AppColors.glassBackgroundGradient,
        ),
        child: Stack(
          children: [
            // Ambient Cyan Glow
            Positioned(
              top: MediaQuery.of(context).size.height * 0.28,
              left: MediaQuery.of(context).size.width * 0.15,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cyanBrand.withAlpha(isDark ? 35 : 20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.cyanBrand.withAlpha(isDark ? 60 : 30),
                      blurRadius: 100,
                      spreadRadius: 20,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _opacityAnimation.value,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Squircle Logo Emblem (Matching reference)
                          Container(
                            width: 88,
                            height: 88,
                            decoration: BoxDecoration(
                              gradient: AppColors.cyanActionGradient,
                              borderRadius: BorderRadius.circular(26),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.cyanBrand.withAlpha(isDark ? 100 : 70),
                                  blurRadius: 28,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'H',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Brand Name
                          Text(
                            'HUDDLE',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2.2,
                              color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Campus Radar • Study Buddies • Hackathons',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: isDark ? AppColors.textDim : AppColors.textDarkMuted,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 48),
                          const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: AlwaysStoppedAnimation<Color>(AppColors.cyanBrand),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
