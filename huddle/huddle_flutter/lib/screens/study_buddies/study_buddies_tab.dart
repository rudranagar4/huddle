import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/campus_top_bar.dart';
import '../../core/widgets/huddle_card.dart';
import '../../core/widgets/state_views.dart';
import 'student_profile_screen.dart';
import 'study_requests_screen.dart';

class StudyBuddiesTab extends StatefulWidget {
  const StudyBuddiesTab({super.key});

  @override
  State<StudyBuddiesTab> createState() => _StudyBuddiesTabState();
}

class _StudyBuddiesTabState extends State<StudyBuddiesTab> {
  final TextEditingController _searchController = TextEditingController();
  List<MatchResult> _allMatches = [];
  List<MatchResult> _filteredMatches = [];
  String _selectedFilter = 'All Matches';
  bool _isLoading = true;

  final List<String> _filters = [
    'All Matches',
    '80%+ Compatibility',
    'Hybrid',
    'Data Science',
    'Late Night',
  ];

  @override
  void initState() {
    super.initState();
    _loadMatches();
  }

  void _loadMatches() async {
    setState(() => _isLoading = true);
    final results = await HuddleService.instance.getSuggestedMatches();
    if (!mounted) return;
    setState(() {
      _allMatches = results;
      _applyFilter();
      _isLoading = false;
    });
  }

  void _applyFilter() {
    final query = _searchController.text.trim().toLowerCase();
    setState(() {
      _filteredMatches = _allMatches.where((m) {
        final student = m.student;
        final matchesQuery = query.isEmpty ||
            student.fullName.toLowerCase().contains(query) ||
            student.course.toLowerCase().contains(query) ||
            student.subjects.any((s) => s.toLowerCase().contains(query)) ||
            student.college.toLowerCase().contains(query);

        bool matchesChip = true;
        if (_selectedFilter == '80%+ Compatibility') {
          matchesChip = m.matchScore >= 80;
        } else if (_selectedFilter == 'Hybrid') {
          matchesChip = student.studyMode.toLowerCase() == 'hybrid';
        } else if (_selectedFilter == 'Data Science') {
          matchesChip = student.course.toLowerCase().contains('data') ||
              student.subjects.any((s) => s.toLowerCase().contains('data'));
        } else if (_selectedFilter == 'Late Night') {
          matchesChip = student.studyTime.toLowerCase() == 'night';
        }

        return matchesQuery && matchesChip;
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => _loadMatches(),
          color: AppColors.cyanBrand,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top App Bar: Logo, College Pill, Notifications & Avatar
                CampusTopBar(
                  onAvatarTap: () {
                    // Navigate to Requests on avatar shortcut or profile
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StudyRequestsScreen()),
                    );
                  },
                ),

                const SizedBox(height: 12),

                // Search Bar + Filter Icon Row (Matching Reference Screenshot 2)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDark ? AppColors.navyCardDark : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle,
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: isDark ? Colors.black.withAlpha(40) : const Color(0x0A0F2B48),
                                blurRadius: 16,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _searchController,
                            style: TextStyle(
                              color: isDark ? Colors.white : AppColors.textDarkHeading,
                              fontSize: 14,
                            ),
                            onChanged: (_) => _applyFilter(),
                            decoration: InputDecoration(
                              hintText: 'Search peer, course code, tech...',
                              hintStyle: TextStyle(
                                color: isDark ? AppColors.textDim : const Color(0xFF94A3B8),
                                fontSize: 13.5,
                              ),
                              prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF94A3B8), size: 20),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (_searchController.text.isNotEmpty)
                                    IconButton(
                                      icon: const Icon(Icons.close_rounded, size: 18),
                                      onPressed: () {
                                        _searchController.clear();
                                        _applyFilter();
                                      },
                                    ),
                                  IconButton(
                                    icon: const Icon(Icons.mic_none_rounded, color: Color(0xFF94A3B8), size: 20),
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      // Filter Sliders Button
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.navyCardDark : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle,
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(8),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.tune_rounded, size: 20),
                          color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const StudyRequestsScreen()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                // Horizontal Filter Chips
                SizedBox(
                  height: 38,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _filters.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final filter = _filters[index];
                      final isSelected = _selectedFilter == filter;

                      String iconText = '';
                      if (filter == 'All Matches') iconText = '⚡ ';
                      if (filter == '80%+ Compatibility') iconText = '✅ ';
                      if (filter == 'Hybrid') iconText = '📍 ';
                      if (filter == 'Data Science') iconText = '📊 ';

                      if (isSelected) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: AppColors.cyanActionGradient,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.cyanBrand.withAlpha(90),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '$iconText$filter',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        );
                      }

                      return GestureDetector(
                        onTap: () {
                          setState(() => _selectedFilter = filter);
                          _applyFilter();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: isDark ? AppColors.navyCardDark : Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle,
                              width: 1.2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '$iconText$filter',
                              style: TextStyle(
                                color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // Dynamic Match Algorithm Info Card (Matching Reference Screenshot 2)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: HuddleCard(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    borderRadius: 18,
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE0F2FE),
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFBAE6FD)),
                          ),
                          child: const Center(
                            child: Icon(Icons.psychology_rounded, color: AppColors.cyanDark, size: 20),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dynamic Match Algorithm',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                                ),
                              ),
                              const SizedBox(height: 2),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 11.5,
                                    color: isDark ? AppColors.textMuted : AppColors.textDarkMuted,
                                    fontFamily: 'Inter',
                                  ),
                                  children: const [
                                    TextSpan(text: '40% ', style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.mintSuccess)),
                                    TextSpan(text: 'Courses • '),
                                    TextSpan(text: '30% ', style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.cyanDark)),
                                    TextSpan(text: 'Interests • '),
                                    TextSpan(text: '30% ', style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF8B5CF6))),
                                    TextSpan(text: 'Study Hours'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Buddies Matches List
                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: LoadingSkeleton(height: 320),
                  )
                else if (_filteredMatches.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: EmptyStateView(
                      icon: Icons.person_search_rounded,
                      title: 'No Matches Found',
                      message: 'Try adjusting your search criteria or clear your subject filters.',
                      actionText: 'Reset Filters',
                      onAction: () {
                        setState(() {
                          _searchController.clear();
                          _selectedFilter = 'All Matches';
                        });
                        _applyFilter();
                      },
                    ),
                  )
                else
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    itemCount: _filteredMatches.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return _buildStudyBuddyCard(_filteredMatches[index], isDark);
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Study Buddy Card (Matching Reference Screenshot 2) ---
  Widget _buildStudyBuddyCard(MatchResult match, bool isDark) {
    final student = match.student;
    final score = match.matchScore;
    final isBookmarked = HuddleService.instance.isBookmarked('student', student.id ?? 1);

    return HuddleCard(
      padding: const EdgeInsets.all(18),
      borderRadius: 24,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentProfileScreen(matchResult: match)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Avatar with Online Dot, Name + Verified, Score Circle
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar with Green Status Dot
              Stack(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: AppColors.cyanPillBg,
                    backgroundImage: NetworkImage(student.avatarUrl ?? ''),
                    onBackgroundImageError: (_, _) {},
                    child: student.avatarUrl == null
                        ? const Icon(Icons.person, color: AppColors.cyanDark, size: 28)
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                        color: AppColors.mintSuccess,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),

              // Name, Department, Active Status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            student.fullName,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.verified_rounded, size: 16, color: Color(0xFF0284C7)),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${student.course} • Year ${student.year}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isDark ? AppColors.textMuted : AppColors.textDarkMuted,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: const [
                        Icon(Icons.access_time_rounded, size: 12, color: AppColors.mintSuccess),
                        SizedBox(width: 4),
                        Text(
                          'Active 12m ago',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.mintText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Match Score Circular Indicator (e.g. 96% BEST MATCH)
              Column(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.cyanBrand, width: 2.5),
                    ),
                    child: Center(
                      child: Text(
                        '$score%',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          color: AppColors.cyanDark,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'BEST MATCH',
                    style: TextStyle(
                      fontSize: 8.5,
                      fontWeight: FontWeight.w800,
                      color: AppColors.cyanDark,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Student Goal Quote
          Text(
            '"${student.bio}"',
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w500,
              color: isDark ? AppColors.textWhite : const Color(0xFF334155),
              height: 1.4,
            ),
          ),

          const SizedBox(height: 14),

          // Preference Pills Row
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _buildPreferencePill('🌙 Late Night (10PM - 3AM)', const Color(0xFFFEF3C7), const Color(0xFFB45309)),
              _buildPreferencePill('⚡ Pair Programming', const Color(0xFFFFEDD5), const Color(0xFFC2410C)),
              _buildPreferencePill('💻 ${student.studyMode.toUpperCase()}', const Color(0xFFE0F2FE), const Color(0xFF0284C7)),
            ],
          ),

          const SizedBox(height: 14),

          // Shared Courses & Vibes Container (Matching Reference Screenshot 2)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark ? AppColors.navySurfaceDark : const Color(0xFFF0F9FF),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark ? AppColors.navyBorderDark : const Color(0xFFBAE6FD),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SHARED COURSES (${match.sharedSubjects.length})',
                      style: const TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w800,
                        color: AppColors.cyanDark,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      '${student.college} Commons',
                      style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w600,
                        color: isDark ? AppColors.textDim : AppColors.textDarkMuted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Course Chips
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: match.sharedSubjects.map((subject) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.navyCardDark : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFBAE6FD)),
                      ),
                      child: Text(
                        subject,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppColors.cyanDark,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 8),

                // Shared Vibes Line
                Row(
                  children: [
                    const Icon(Icons.hub_rounded, size: 13, color: AppColors.cyanDark),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Shared vibes: ${student.interests.join(" • ")}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: isDark ? AppColors.textMuted : AppColors.textDarkMuted,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Action Buttons: Send Study Request & Bookmark
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    gradient: AppColors.cyanActionGradient,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.cyanBrand.withAlpha(90),
                        blurRadius: 14,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () => _showSendRequestModal(context, student),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.send_rounded, size: 16, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Send Study Request',
                          style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.navySurfaceDark : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle,
                    width: 1.2,
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                    size: 20,
                    color: isBookmarked ? AppColors.cyanDark : (isDark ? Colors.white : AppColors.textDarkHeading),
                  ),
                  onPressed: () async {
                    await HuddleService.instance.toggleBookmark('student', student.id ?? 1);
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPreferencePill(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4.5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }

  void _showSendRequestModal(BuildContext context, Student target) {
    final noteController = TextEditingController(
      text: 'Hey ${target.fullName}! I saw you are studying ${target.subjects.isNotEmpty ? target.subjects.first : "Data Science"} at ${target.college}. Would love to connect and prep together!',
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        final isDark = Theme.of(ctx).brightness == Brightness.dark;
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? AppColors.navyCardDark : Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(target.avatarUrl ?? ''),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Connect with ${target.fullName}',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          target.college,
                          style: const TextStyle(fontSize: 12, color: AppColors.cyanDark),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Introductory Note', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextField(
                  controller: noteController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Share what you are studying or your study goals...',
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(ctx);
                      await HuddleService.instance.sendStudyRequest(target.id ?? 1, noteController.text.trim());
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.mintSuccess,
                            content: Text('Study request sent to ${target.fullName}!'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.cyanBrand,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('Send Connection Request', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
