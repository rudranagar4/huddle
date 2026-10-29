import 'package:flutter/material.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/campus_top_bar.dart';
import '../../core/widgets/huddle_card.dart';
import '../bookmarks/bookmarks_screen.dart';
import '../quizzes/quiz_list_screen.dart';
import '../settings/settings_screen.dart';
import 'edit_profile_screen.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    final s = HuddleService.instance.currentStudent;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            children: [
              // Top Bar
              CampusTopBar(
                onAvatarTap: () {},
              ),

              const SizedBox(height: 12),

              // Student Profile Hero Glass Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: HuddleCard(
                  padding: const EdgeInsets.all(20),
                  borderRadius: 24,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.cyanBrand, width: 2.5),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.cyanBrand.withAlpha(80),
                                  blurRadius: 14,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 38,
                              backgroundImage: NetworkImage(
                                s.avatarUrl ?? 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=400',
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        s.fullName,
                                        style: TextStyle(
                                          color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Icon(Icons.verified_rounded, size: 18, color: Color(0xFF0284C7)),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  '${s.course} • Year ${s.year}',
                                  style: const TextStyle(
                                    color: AppColors.cyanDark,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.school_rounded, size: 13, color: Color(0xFF64748B)),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        s.college,
                                        style: TextStyle(
                                          color: isDark ? AppColors.textMuted : AppColors.textDarkMuted,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      // Bio Quote
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.navySurfaceDark : const Color(0xFFF0F9FF),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFBAE6FD)),
                        ),
                        child: Text(
                          '"${s.bio}"',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w500,
                            color: isDark ? AppColors.textWhite : const Color(0xFF334155),
                            height: 1.4,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Quick Stats Row
                      Row(
                        children: [
                          _buildStatItem('96%', 'Top Match', AppColors.cyanDark),
                          _buildStatItem('2', 'Joined Clubs', AppColors.mintText),
                          _buildStatItem('3', 'Hackathons', const Color(0xFF8B5CF6)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Study Preferences & Focus
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: HuddleCard(
                  padding: const EdgeInsets.all(18),
                  borderRadius: 22,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Study Preferences',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildPreferenceBadge('Mode', s.studyMode.toUpperCase(), Icons.laptop_chromebook_rounded),
                          _buildPreferenceBadge('Time', 'NIGHT OWL', Icons.nightlight_round),
                          _buildPreferenceBadge('Style', 'PAIR STUDY', Icons.people_alt_rounded),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Core Courses & Interests',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          ...s.subjects.map((sub) => _buildChip(sub, const Color(0xFFE0F2FE), const Color(0xFF0284C7))),
                          ...s.interests.map((interest) => _buildChip(interest, const Color(0xFFFEF3C7), const Color(0xFFB45309))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Quick Actions List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: HuddleCard(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  borderRadius: 22,
                  child: Column(
                    children: [
                      _buildActionTile(
                        icon: Icons.edit_note_rounded,
                        color: AppColors.cyanDark,
                        title: 'Edit Student Profile',
                        subtitle: 'Update course, bio, and study preferences',
                        onTap: () async {
                          final updated = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => EditProfileScreen(student: s)),
                          );
                          if (updated == true) setState(() {});
                        },
                      ),
                      const Divider(height: 1, indent: 56, endIndent: 16),
                      _buildActionTile(
                        icon: Icons.bookmark_added_rounded,
                        color: AppColors.mintText,
                        title: 'Saved Bookmarks',
                        subtitle: 'View saved events and peer profiles',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const BookmarksScreen()));
                        },
                      ),
                      const Divider(height: 1, indent: 56, endIndent: 16),
                      _buildActionTile(
                        icon: Icons.quiz_rounded,
                        color: const Color(0xFF8B5CF6),
                        title: 'Campus Quizzes & Sprints',
                        subtitle: 'DSA, Machine Learning, and Web challenges',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizListScreen()));
                        },
                      ),
                      const Divider(height: 1, indent: 56, endIndent: 16),
                      _buildActionTile(
                        icon: Icons.settings_rounded,
                        color: const Color(0xFF64748B),
                        title: 'App Settings & Theme',
                        subtitle: 'Dark/Light mode switch, notifications',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String val, String label, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            val,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: color),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }

  Widget _buildPreferenceBadge(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.cyanDark),
          const SizedBox(width: 5),
          Text(
            '$label: ',
            style: const TextStyle(fontSize: 11, color: Color(0xFF64748B), fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Color(0xFF0F172A)),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String text, Color bg, Color textCol) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4.5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: textCol),
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      leading: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: color.withAlpha(25),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14.5,
          fontWeight: FontWeight.w700,
          color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 11.5,
          color: isDark ? AppColors.textDim : AppColors.textDarkMuted,
        ),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, size: 18, color: Color(0xFF94A3B8)),
      onTap: onTap,
    );
  }
}
