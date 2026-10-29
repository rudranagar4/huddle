import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import 'package:intl/intl.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/campus_top_bar.dart';
import '../../core/widgets/huddle_card.dart';
import '../../core/widgets/state_views.dart';
import 'event_details_screen.dart';

class EventsTab extends StatefulWidget {
  const EventsTab({super.key});

  @override
  State<EventsTab> createState() => _EventsTabState();
}

class _EventsTabState extends State<EventsTab> {
  final TextEditingController _searchController = TextEditingController();
  List<CampusEvent> _events = [];
  String _selectedCategory = 'All Events';
  bool _isLoading = true;

  final List<Map<String, dynamic>> _filterChips = [
    {'label': 'All Events', 'count': 28, 'emoji': ''},
    {'label': 'Hackathons', 'count': 8, 'emoji': '🚀'},
    {'label': 'Workshops', 'count': 12, 'emoji': '⚒️'},
    {'label': 'Speaker Sessions', 'count': 5, 'emoji': '🎙️'},
    {'label': 'Competitions', 'count': 3, 'emoji': '🏆'},
  ];

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  void _loadEvents() async {
    setState(() => _isLoading = true);
    final cat = (_selectedCategory == 'All Events') ? null : (_selectedCategory == 'Hackathons' ? 'Hackathon' : _selectedCategory);
    final events = await HuddleService.instance.getEvents(
      category: cat,
      search: _searchController.text.trim(),
    );
    if (!mounted) return;
    setState(() {
      _events = events;
      _isLoading = false;
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

    // Featured Hero Event (Item 0)
    final featuredEvent = _events.isNotEmpty ? _events.first : null;
    final upcomingList = _events.length > 1 ? _events.sublist(1) : <CampusEvent>[];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => _loadEvents(),
          color: AppColors.cyanBrand,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top App Bar with Logo, College Pill, Notifications & Avatar
                const CampusTopBar(),

                const SizedBox(height: 12),

                // Radar Subtitle & Main Headline
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.radar_rounded, size: 14, color: AppColors.cyanBrand),
                              SizedBox(width: 5),
                              Text(
                                'CAMPUS LIVE RADAR',
                                style: TextStyle(
                                  color: AppColors.cyanBrand,
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Events & RSVP Hub',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),

                      // Filter circle button
                      Container(
                        width: 44,
                        height: 44,
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
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Search Bar with Mic Icon
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                      onSubmitted: (_) => _loadEvents(),
                      decoration: InputDecoration(
                        hintText: 'Search hackathons, workshops, guest...',
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
                                  _loadEvents();
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

                const SizedBox(height: 16),

                // Horizontal Filter Chips (Selected: Solid Cyan with count bubble)
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _filterChips.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final item = _filterChips[index];
                      final label = item['label'] as String;
                      final isSelected = _selectedCategory == label;
                      final emoji = item['emoji'] as String;
                      final count = item['count'] as int;

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
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                label,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(40),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  '$count',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return GestureDetector(
                        onTap: () {
                          setState(() => _selectedCategory = label);
                          _loadEvents();
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
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (emoji.isNotEmpty) ...[
                                Text(emoji, style: const TextStyle(fontSize: 13)),
                                const SizedBox(width: 6),
                              ],
                              Text(
                                label,
                                style: TextStyle(
                                  color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Main Content
                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: LoadingSkeleton(height: 380),
                  )
                else if (_events.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: EmptyStateView(
                      icon: Icons.event_busy_rounded,
                      title: 'No Events Found',
                      message: 'Try adjusting your search query or switching to another category.',
                      actionText: 'View All Events',
                      onAction: () {
                        setState(() {
                          _selectedCategory = 'All Events';
                          _searchController.clear();
                        });
                        _loadEvents();
                      },
                    ),
                  )
                else ...[
                  // 1. Featured Campus Event Hero Card (Matching Reference Screenshot 1)
                  if (featuredEvent != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: _buildFeaturedEventCard(featuredEvent, isDark),
                    ),

                  const SizedBox(height: 28),

                  // 2. Upcoming Lineup Section Header
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
                              'Upcoming Lineup',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: const [
                              Text(
                                'View Calendar',
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

                  // 3. Compact Upcoming Event Cards
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    itemCount: upcomingList.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return _buildUpcomingEventCard(upcomingList[index], isDark);
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Featured Hero Event Card ---
  Widget _buildFeaturedEventCard(CampusEvent event, bool isDark) {
    final isRegistered = HuddleService.instance.isEventRegistered(event.id ?? 1);
    final totalSeats = event.totalSeats > 0 ? event.totalSeats : 200;
    final registeredSeats = event.registeredSeats;
    final seatsLeft = totalSeats - registeredSeats;
    final progress = (registeredSeats / totalSeats).clamp(0.0, 1.0);
    final isBookmarked = HuddleService.instance.isBookmarked('event', event.id ?? 1);

    return HuddleCard(
      padding: EdgeInsets.zero,
      borderRadius: 24,
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventDetailsScreen(event: event)),
        );
        setState(() {});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero Banner Image with Overlays
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: Image.network(
                  event.bannerUrl ?? '',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    height: 180,
                    color: const Color(0xFF1E293B),
                    child: const Center(
                      child: Icon(Icons.code_rounded, color: AppColors.cyanBrand, size: 40),
                    ),
                  ),
                ),
              ),

              // Gradient dark vignette for text contrast
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withAlpha(50),
                        Colors.transparent,
                        Colors.black.withAlpha(150),
                      ],
                    ),
                  ),
                ),
              ),

              // Top-left: FEATURED CAMPUS EVENT Tag
              Positioned(
                top: 14,
                left: 14,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(220),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(20),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.local_fire_department_rounded, size: 14, color: AppColors.cyanBrand),
                      SizedBox(width: 4),
                      Text(
                        'FEATURED CAMPUS EVENT',
                        style: TextStyle(
                          color: AppColors.textDarkHeading,
                          fontSize: 10.5,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Top-right: Bookmark Button
              Positioned(
                top: 14,
                right: 14,
                child: GestureDetector(
                  onTap: () async {
                    await HuddleService.instance.toggleBookmark('event', event.id ?? 1);
                    setState(() {});
                  },
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(230),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(25),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Icon(
                      isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                      color: isBookmarked ? AppColors.cyanDark : AppColors.textDarkHeading,
                      size: 20,
                    ),
                  ),
                ),
              ),

              // Bottom-left: Organizer Tag
              Positioned(
                bottom: 12,
                left: 14,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(140),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: AppColors.mintSuccess,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        event.organizer,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Details section below image
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event Title
                Text(
                  event.title,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                    letterSpacing: -0.3,
                  ),
                ),

                const SizedBox(height: 10),

                // Date & Time
                Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded, size: 14, color: AppColors.cyanDark),
                    const SizedBox(width: 6),
                    Text(
                      event.time.isNotEmpty ? event.time : DateFormat('EEE, MMM d • h:mm a').format(event.date),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isDark ? AppColors.textMuted : AppColors.textDarkBody,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Venue
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded, size: 15, color: Color(0xFF8B5CF6)),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        event.venue,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isDark ? AppColors.textMuted : AppColors.textDarkMuted,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Progress Bar Row: Registered vs Seats Left
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$registeredSeats / $totalSeats Registered',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: isDark ? AppColors.textMuted : AppColors.textDarkMuted,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 7,
                                height: 7,
                                decoration: const BoxDecoration(
                                  color: AppColors.cyanBrand,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '$seatsLeft Seats Left!',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.cyanDark,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 7,
                          backgroundColor: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
                          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.cyanBrand),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Actions: 1-Tap RSVP Button & Share Button
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: isRegistered
                              ? null
                              : AppColors.cyanActionGradient,
                          color: isRegistered
                              ? (isDark ? const Color(0xFF1E293B) : const Color(0xFFDCFCE7))
                              : null,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: isRegistered
                              ? null
                              : [
                                  BoxShadow(
                                    color: AppColors.cyanBrand.withAlpha(90),
                                    blurRadius: 16,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            final nowRegistered = await HuddleService.instance.toggleEventRegistration(event.id ?? 1);
                            setState(() {});
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: nowRegistered ? AppColors.mintSuccess : AppColors.coral,
                                  content: Text(
                                    nowRegistered
                                        ? '🎉 Successfully RSVP\'d to ${event.title}!'
                                        : 'RSVP Cancelled for ${event.title}',
                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isRegistered ? Icons.check_circle_rounded : Icons.bolt_rounded,
                                color: isRegistered ? AppColors.mintText : Colors.white,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                isRegistered ? 'RSVP\'d • Attending' : '1-Tap RSVP',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: isRegistered ? AppColors.mintText : Colors.white,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.navySurfaceDark : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle,
                          width: 1.2,
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.share_outlined, size: 20),
                        color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Event link copied to clipboard!')),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Compact Upcoming Lineup Card ---
  Widget _buildUpcomingEventCard(CampusEvent event, bool isDark) {
    final isRegistered = HuddleService.instance.isEventRegistered(event.id ?? 1);

    return HuddleCard(
      padding: const EdgeInsets.all(14),
      borderRadius: 20,
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventDetailsScreen(event: event)),
        );
        setState(() {});
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // RSVP'd or Category Pill
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
                  decoration: BoxDecoration(
                    color: isRegistered
                        ? AppColors.mintLight
                        : AppColors.cyanPillBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isRegistered ? Icons.check_circle_rounded : Icons.label_important_outline_rounded,
                        size: 12,
                        color: isRegistered ? AppColors.mintText : AppColors.cyanPillText,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        isRegistered ? 'RSVP\'d • Registered' : event.category,
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          color: isRegistered ? AppColors.mintText : AppColors.cyanPillText,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 7),

                // Organizer
                Text(
                  event.organizer,
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.textDim : AppColors.textDarkMuted,
                  ),
                ),

                const SizedBox(height: 3),

                // Event Title
                Text(
                  event.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                  ),
                ),

                const SizedBox(height: 7),

                // Date & Time
                Row(
                  children: [
                    const Icon(Icons.access_time_rounded, size: 13, color: AppColors.cyanDark),
                    const SizedBox(width: 4),
                    Text(
                      event.time.isNotEmpty ? event.time : DateFormat('MMM d, h:mm a').format(event.date),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isDark ? AppColors.textMuted : AppColors.textDarkMuted,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),

          // Thumbnail Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              event.bannerUrl ?? '',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                width: 80,
                height: 80,
                color: const Color(0xFF1E293B),
                child: const Icon(Icons.event_rounded, color: AppColors.cyanBrand),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
