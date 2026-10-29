import 'package:flutter/material.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/huddle_button.dart';
import '../../core/widgets/huddle_card.dart';
import '../auth/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _studyRequestAlerts = true;
  bool _eventReminders = true;
  bool _communityUpdates = true;

  void _showChangePasswordDialog(bool isDark) {
    final oldController = TextEditingController();
    final newController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? AppColors.navyCardDark : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderLight),
        ),
        title: Text(
          'Change Password',
          style: TextStyle(
            color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
            fontWeight: FontWeight.w800,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: oldController,
              obscureText: true,
              style: TextStyle(color: isDark ? AppColors.textWhite : AppColors.textDarkHeading),
              decoration: InputDecoration(
                hintText: 'Current Password',
                filled: true,
                fillColor: isDark ? AppColors.navySurfaceDark : AppColors.glassCardLightSolid,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: newController,
              obscureText: true,
              style: TextStyle(color: isDark ? AppColors.textWhite : AppColors.textDarkHeading),
              decoration: InputDecoration(
                hintText: 'New Password (min 6 chars)',
                filled: true,
                fillColor: isDark ? AppColors.navySurfaceDark : AppColors.glassCardLightSolid,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Cancel', style: TextStyle(color: isDark ? AppColors.textDim : AppColors.textDarkSubtle)),
          ),
          HuddleButton(
            text: 'Update',
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Password updated successfully!'),
                  backgroundColor: AppColors.cyanDark,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(bool isDark) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? AppColors.navyCardDark : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Icon(Icons.groups_rounded, color: AppColors.cyanBrand),
            const SizedBox(width: 10),
            Text(
              'About HUDDLE',
              style: TextStyle(
                color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HUDDLE v1.0.0 (Build Arena)',
              style: TextStyle(
                color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'HUDDLE is a campus-life platform that bridges fragmented campus communication. Powered by Flutter, Dart, Serverpod, and PostgreSQL.',
              style: TextStyle(
                color: isDark ? AppColors.textMuted : AppColors.textDarkBody,
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Backend: Serverpod 3.4.13\nDatabase: PostgreSQL\nFrontend: Flutter Multiplatform',
              style: TextStyle(color: AppColors.cyanDark, fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close', style: TextStyle(color: AppColors.cyanDark, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      appBar: AppBar(
        title: Text(
          'Settings & Preferences',
          style: TextStyle(
            color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        backgroundColor: isDark ? AppColors.navySurfaceDark.withAlpha(200) : Colors.white.withAlpha(180),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: isDark ? AppColors.textWhite : AppColors.textDarkHeading),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? null : AppColors.glassBackgroundGradient,
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          children: [
            // Theme Section
            _sectionHeader('APPEARANCE & THEME', isDark),
            const SizedBox(height: 10),
            HuddleCard(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.cyanBrand.withAlpha(isDark ? 40 : 25),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                          color: AppColors.cyanDark,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dark Theme',
                            style: TextStyle(
                              color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            isDark ? 'Deep Midnight Navy' : 'Frosted Ice-Blue Glass',
                            style: TextStyle(
                              color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Switch(
                    value: isDark,
                    activeThumbColor: AppColors.cyanBrand,
                    activeTrackColor: AppColors.cyanDark.withAlpha(100),
                    onChanged: (val) {
                      setState(() {
                        HuddleService.instance.toggleTheme();
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Notifications Preferences
            _sectionHeader('NOTIFICATIONS', isDark),
            const SizedBox(height: 10),
            HuddleCard(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                children: [
                  _switchTile(
                    icon: Icons.person_add_rounded,
                    title: 'Study Request Alerts',
                    subtitle: 'When other students invite you to collaborate',
                    value: _studyRequestAlerts,
                    isDark: isDark,
                    onChanged: (v) => setState(() => _studyRequestAlerts = v),
                  ),
                  Divider(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle, height: 16),
                  _switchTile(
                    icon: Icons.event_available_rounded,
                    title: 'Campus Event Reminders',
                    subtitle: '24h before registered hackathons & workshops',
                    value: _eventReminders,
                    isDark: isDark,
                    onChanged: (v) => setState(() => _eventReminders = v),
                  ),
                  Divider(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle, height: 16),
                  _switchTile(
                    icon: Icons.groups_3_rounded,
                    title: 'Community Announcements',
                    subtitle: 'Updates from joined student clubs',
                    value: _communityUpdates,
                    isDark: isDark,
                    onChanged: (v) => setState(() => _communityUpdates = v),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Security & Account
            _sectionHeader('SECURITY & ACCOUNT', isDark),
            const SizedBox(height: 10),
            HuddleCard(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.cyanBrand.withAlpha(25),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.lock_reset_rounded, color: AppColors.cyanDark, size: 18),
                    ),
                    title: Text(
                      'Change Password',
                      style: TextStyle(
                        color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    trailing: Icon(Icons.chevron_right_rounded, color: isDark ? AppColors.textDim : AppColors.textDarkSubtle),
                    onTap: () => _showChangePasswordDialog(isDark),
                  ),
                  Divider(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle, height: 12),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.cyanBrand.withAlpha(25),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.info_outline_rounded, color: AppColors.cyanDark, size: 18),
                    ),
                    title: Text(
                      'About HUDDLE',
                      style: TextStyle(
                        color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      'Hackathon build details & stack info',
                      style: TextStyle(color: isDark ? AppColors.textDim : AppColors.textDarkSubtle, fontSize: 12),
                    ),
                    trailing: Icon(Icons.chevron_right_rounded, color: isDark ? AppColors.textDim : AppColors.textDarkSubtle),
                    onTap: () => _showAboutDialog(isDark),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),

            // Logout Button
            HuddleButton(
              width: double.infinity,
              height: 52,
              text: 'Sign Out of HUDDLE',
              icon: Icons.logout_rounded,
              variant: HuddleButtonVariant.outline,
              customColor: AppColors.coral,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: isDark ? AppColors.navyCardDark : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: Text(
                      'Sign Out?',
                      style: TextStyle(color: isDark ? AppColors.textWhite : AppColors.textDarkHeading, fontWeight: FontWeight.w800),
                    ),
                    content: Text(
                      'Are you sure you want to log out of your HUDDLE account?',
                      style: TextStyle(color: isDark ? AppColors.textMuted : AppColors.textDarkBody),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: Text('Cancel', style: TextStyle(color: isDark ? AppColors.textDim : AppColors.textDarkSubtle)),
                      ),
                      HuddleButton(
                        text: 'Log Out',
                        customColor: AppColors.coral,
                        onPressed: () async {
                          Navigator.pop(ctx);
                          await HuddleService.instance.logout();
                          if (!mounted || !context.mounted) return;
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) => const LoginScreen()),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, bool isDark) {
    return Text(
      title,
      style: TextStyle(
        color: isDark ? AppColors.cyanBrand : AppColors.cyanDark,
        fontWeight: FontWeight.w800,
        fontSize: 12,
        letterSpacing: 0.8,
      ),
    );
  }

  Widget _switchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required bool isDark,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.cyanBrand.withAlpha(25),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.cyanDark, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            activeThumbColor: AppColors.cyanBrand,
            activeTrackColor: AppColors.cyanDark.withAlpha(100),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
