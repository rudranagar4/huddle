import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/widgets/huddle_button.dart';
import 'auth/login_screen.dart';
import 'auth/register_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _slides = [
    {
      'icon': Icons.radar_rounded,
      'title': 'Campus Live Radar &\nRSVP Hub',
      'subtitle':
          'Discover 48h hackathons, tech talks, and project sprints at IIT Bombay, BITS Pilani, and top colleges across India.',
      'gradient': const [Color(0xFF00E5FF), Color(0xFF0091EA)],
    },
    {
      'icon': Icons.hub_rounded,
      'title': 'AI-Powered Study\nPartner Matching',
      'subtitle':
          'Find accountability partners for algorithms, data science, and winter interview prep with high compatibility matching.',
      'gradient': const [Color(0xFF00B0FF), Color(0xFF00838F)],
    },
    {
      'icon': Icons.groups_rounded,
      'title': 'Connect With\nCampus Chapters',
      'subtitle':
          'Join active student clubs like GDSC, AI Society, and Competitive Programming cell to build real-world products.',
      'gradient': const [Color(0xFF00E676), Color(0xFF00B0FF)],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? null : AppColors.glassBackgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Skip Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            gradient: AppColors.cyanActionGradient,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.groups_rounded, size: 16, color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'HUDDLE',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2,
                            color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                          ),
                        ),
                      ],
                    ),
                    if (_currentPage < _slides.length - 1)
                      TextButton(
                        onPressed: () {
                          _pageController.animateToPage(
                            _slides.length - 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: isDark ? AppColors.textDim : AppColors.textDarkMuted,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Page View
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _slides.length,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  itemBuilder: (context, index) {
                    final slide = _slides[index];
                    final List<Color> colors = slide['gradient'];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Slide Hero Container
                          Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: colors,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: colors.first.withAlpha(isDark ? 100 : 70),
                                  blurRadius: 40,
                                  spreadRadius: 4,
                                ),
                              ],
                            ),
                            child: Icon(
                              slide['icon'] as IconData,
                              size: 64,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 44),
                          Text(
                            slide['title'] as String,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                              height: 1.25,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            slide['subtitle'] as String,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: isDark ? AppColors.textMuted : AppColors.textDarkBody,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Indicators & Action Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: Column(
                  children: [
                    // Dot Indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _slides.length,
                        (i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == i ? 28 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == i
                                ? AppColors.cyanBrand
                                : (isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Get Started / Next Button
                    HuddleButton(
                      width: double.infinity,
                      height: 52,
                      text: _currentPage == _slides.length - 1 ? 'Get Started' : 'Next',
                      icon: _currentPage == _slides.length - 1
                          ? Icons.arrow_forward_rounded
                          : Icons.chevron_right_rounded,
                      onPressed: () {
                        if (_currentPage < _slides.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const RegisterScreen()),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 14),
                    // Log In Option
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: isDark ? AppColors.textMuted : AppColors.textDarkMuted,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const LoginScreen()),
                            );
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              color: AppColors.cyanDark,
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
