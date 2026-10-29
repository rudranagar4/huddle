import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/campus_top_bar.dart';
import '../../core/widgets/huddle_card.dart';
import '../../core/widgets/state_views.dart';
import '../communities/community_detail_screen.dart';
import '../events/event_details_screen.dart';
import '../quizzes/quiz_list_screen.dart';
import '../study_buddies/student_profile_screen.dart';
import '../study_buddies/study_requests_screen.dart';

class DashboardTab extends StatefulWidget {
  final Function(int)? onSwitchTab;

  const DashboardTab({super.key, this.onSwitchTab});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  List<MatchResult> _matches = [];
  List<CampusEvent> _events = [];
  List<Community> _communities = [];
  List<StudyRequest> _incomingRequests = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDashboardData();
  }

  void _loadDashboardData() async {
    setState(() => _isLoading = true);
    final matches = await HuddleService.instance.getSuggestedMatches();
    final events = await HuddleService.instance.getEvents();
    final comms = await HuddleService.instance.getCommunities();
    final reqs = await HuddleService.instance.getIncomingRequests();

    if (!mounted) return;
    setState(() {
      _matches = matches;
      _events = events;
      _communities = comms;
      _incomingRequests = reqs;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = HuddleService.instance.currentStudent;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => _loadDashboardData(),
          color: AppColors.cyanBrand,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top App Bar
                CampusTopBar(
                  onAvatarTap: () => widget.onSwitchTab?.call(4),
                ),

                const SizedBox(height: 12),

                // Greeting & Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Namaste, ${s.fullName.split(" ").first}! 👋',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.cyanPillBg,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'IIT BOMBAY',
                              style: TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w800,
                                color: AppColors.cyanDark,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${s.course} • Year ${s.year}',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: isDark ? AppColors.textMuted : AppColors.textDarkMuted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // Quick Action Navigation Pills
                SizedBox(
                  height: 42,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      _buildQuickActionPill('⚡ Find Study Buddy', () => widget.onSwitchTab?.call(1), isPrimary: true),
                      const SizedBox(width: 8),
                      _buildQuickActionPill('🚀 SIH & Hackathons', () => widget.onSwitchTab?.call(2)),
                      const SizedBox(width: 8),
                      _buildQuickActionPill('📝 Solve Quizzes', () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizListScreen()));
                      }),
                      const SizedBox(width: 8),
                      _buildQuickActionPill('🏛️ Campus Clubs', () => widget.onSwitchTab?.call(3)),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Pending Incoming Request Alert Banner (if any)
                if (_incomingRequests.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: _buildPendingRequestBanner(_incomingRequests.first, isDark),
                  ),

                const SizedBox(height: 24),

                // Top Matched Study Partners (Horizontal Carousel)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.cyanBrand,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Top Matched Peers',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => widget.onSwitchTab?.call(1),
                        child: Row(
                          children: const [
                            Text(
                              'View All',
                              style: TextStyle(
                                color: AppColors.cyanDark,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(width: 2),
                            Icon(Icons.chevron_right_rounded, size: 16, color: AppColors.cyanDark),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: LoadingSkeleton(height: 180),
                  )
                else if (_matches.isNotEmpty)
                  SizedBox(
                    height: 195,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _matches.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        return _buildHorizontalPeerCard(_matches[index], isDark);
                      },
                    ),
                  ),

                const SizedBox(height: 24),

                // Featured Hackathon Spotlight
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF8B5CF6),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Spotlight Event',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => widget.onSwitchTab?.call(2),
                        child: Row(
                          children: const [
                            Text(
                              'More Events',
                              style: TextStyle(
                                color: AppColors.cyanDark,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(width: 2),
                            Icon(Icons.chevron_right_rounded, size: 16, color: AppColors.cyanDark),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                if (_events.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: _buildSpotlightEventCard(_events.first, isDark),
                  ),

                const SizedBox(height: 24),

                // Joined Communities & Circles
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.mintSuccess,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Joined Clubs',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => widget.onSwitchTab?.call(3),
                        child: Row(
                          children: const [
                            Text(
                              'Explore All',
                              style: TextStyle(
                                color: AppColors.cyanDark,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(width: 2),
                            Icon(Icons.chevron_right_rounded, size: 16, color: AppColors.cyanDark),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  itemCount: _communities.take(2).length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final comm = _communities[index];
                    return _buildClubCard(comm, isDark);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionPill(String title, VoidCallback onTap, {bool isPrimary = false}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isPrimary) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            gradient: AppColors.cyanActionGradient,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.cyanBrand.withAlpha(90),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
            title,
            style: TextStyle(
              color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPendingRequestBanner(StudyRequest request, bool isDark) {
    return HuddleCard(
      padding: const EdgeInsets.all(16),
      borderRadius: 20,
      backgroundColor: isDark ? AppColors.navyCardDark : const Color(0xFFF0FDF4),
      border: Border.all(color: const Color(0xFF86EFAC), width: 1.2),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const StudyRequestsScreen()),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(request.senderAvatar ?? ''),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Study Request Pending',
                      style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w800, color: AppColors.mintText),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(color: AppColors.mintSuccess, shape: BoxShape.circle),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '${request.senderName} wants to partner for study & hackathons',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.mintText),
        ],
      ),
    );
  }

  Widget _buildHorizontalPeerCard(MatchResult match, bool isDark) {
    final s = match.student;
    return HuddleCard(
      padding: const EdgeInsets.all(14),
      borderRadius: 22,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => StudentProfileScreen(matchResult: match)),
        );
      },
      child: SizedBox(
        width: 165,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(s.avatarUrl ?? ''),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.cyanBrand,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${match.matchScore}%',
                      style: const TextStyle(color: Colors.white, fontSize: 9.5, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              s.fullName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
              ),
            ),
            Text(
              s.college,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.cyanDark),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
              decoration: BoxDecoration(
                color: isDark ? AppColors.navySurfaceDark : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                s.subjects.isNotEmpty ? s.subjects.first : 'Data Science',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.textMuted : AppColors.textDarkBody,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpotlightEventCard(CampusEvent event, bool isDark) {
    return HuddleCard(
      padding: EdgeInsets.zero,
      borderRadius: 22,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => EventDetailsScreen(event: event)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
            child: Image.network(
              event.bannerUrl ?? '',
              height: 130,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${event.time} • ${event.venue}',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? AppColors.textMuted : AppColors.textDarkMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClubCard(Community comm, bool isDark) {
    return HuddleCard(
      padding: const EdgeInsets.all(14),
      borderRadius: 20,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => CommunityDetailScreen(community: comm)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              comm.iconUrl ?? '',
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comm.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w800,
                    color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${comm.memberCount} members • ${comm.upcomingEventsCount} events upcoming',
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w500,
                    color: isDark ? AppColors.textMuted : AppColors.textDarkMuted,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.cyanDark),
        ],
      ),
    );
  }
}
