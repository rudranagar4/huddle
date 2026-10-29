import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'communities/communities_tab.dart';
import 'events/events_tab.dart';
import 'home/dashboard_tab.dart';
import 'profile/profile_tab.dart';
import 'study_buddies/study_buddies_tab.dart';

class NavigationShell extends StatefulWidget {
  final int initialIndex;

  const NavigationShell({super.key, this.initialIndex = 0});

  @override
  State<NavigationShell> createState() => _NavigationShellState();
}

class _NavigationShellState extends State<NavigationShell> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _switchTab(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Widget> tabs = [
      DashboardTab(onSwitchTab: _switchTab),
      const StudyBuddiesTab(),
      const EventsTab(),
      const CommunitiesTab(),
      const ProfileTab(),
    ];

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? null : AppColors.iceBackgroundGradient,
        ),
        child: IndexedStack(
          index: _currentIndex,
          children: tabs,
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black.withAlpha(90) : const Color(0x140284C7),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              height: 68,
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.navyCardDark.withAlpha(220)
                    : Colors.white.withAlpha(230),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(
                  color: isDark ? AppColors.navyBorderDark : Colors.white.withAlpha(200),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(0, Icons.home_outlined, Icons.home_rounded, 'Home'),
                  _buildNavItem(1, Icons.auto_awesome_outlined, Icons.auto_awesome, 'Buddies'),
                  _buildNavItem(2, Icons.calendar_month_outlined, Icons.calendar_month_rounded, 'Events'),
                  _buildNavItem(3, Icons.groups_outlined, Icons.groups_rounded, 'Clubs'),
                  _buildNavItem(4, Icons.person_outline_rounded, Icons.person_rounded, 'Profile'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData unselectedIcon, IconData selectedIcon, String label) {
    final isSelected = _currentIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final activeColor = AppColors.cyanBrand;
    final inactiveColor = isDark ? AppColors.textDim : const Color(0xFF64748B);

    return InkWell(
      onTap: () => _switchTab(index),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? selectedIcon : unselectedIcon,
              color: isSelected ? activeColor : inactiveColor,
              size: 23,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? activeColor : inactiveColor,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
