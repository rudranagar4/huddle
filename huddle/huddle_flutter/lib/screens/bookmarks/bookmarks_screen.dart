import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/huddle_card.dart';
import '../../core/widgets/state_views.dart';
import '../communities/community_detail_screen.dart';
import '../events/event_details_screen.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<CampusEvent> _bookmarkedEvents = [];
  List<Community> _bookmarkedCommunities = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _load();
  }

  void _load() async {
    setState(() => _isLoading = true);
    final allEvents = await HuddleService.instance.getEvents();
    final allComm = await HuddleService.instance.getCommunities();

    if (!mounted) return;
    setState(() {
      _bookmarkedEvents = allEvents.where((e) => HuddleService.instance.isBookmarked('event', e.id ?? 1)).toList();
      _bookmarkedCommunities = allComm.where((c) => HuddleService.instance.isBookmarked('community', c.id ?? 1)).toList();
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      appBar: AppBar(
        title: Text(
          'Saved Bookmarks',
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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.cyanBrand,
          indicatorWeight: 3,
          labelColor: isDark ? AppColors.cyanBrand : AppColors.cyanDark,
          unselectedLabelColor: isDark ? AppColors.textDim : AppColors.textDarkMuted,
          labelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
          tabs: [
            Tab(text: 'Events (${_bookmarkedEvents.length})'),
            Tab(text: 'Communities (${_bookmarkedCommunities.length})'),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? null : AppColors.glassBackgroundGradient,
        ),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator(color: AppColors.cyanBrand))
            : TabBarView(
                controller: _tabController,
                children: [
                  _buildEventsTab(isDark),
                  _buildCommunitiesTab(isDark),
                ],
              ),
      ),
    );
  }

  Widget _buildEventsTab(bool isDark) {
    if (_bookmarkedEvents.isEmpty) {
      return const EmptyStateView(
        icon: Icons.bookmark_border_rounded,
        title: 'No Saved Events',
        message: 'Tap the bookmark icon on any campus event card to save it here for quick access.',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      itemCount: _bookmarkedEvents.length,
      itemBuilder: (context, index) {
        final ev = _bookmarkedEvents[index];
        return HuddleCard(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => EventDetailsScreen(event: ev)),
            );
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  ev.bannerUrl ?? 'https://images.unsplash.com/photo-1515187029135-18ee286d815b?w=800',
                  width: 76,
                  height: 76,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ev.title,
                      style: TextStyle(
                        color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ev.organizer,
                      style: const TextStyle(
                        color: AppColors.cyanDark,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 12, color: isDark ? AppColors.textDim : AppColors.textDarkSubtle),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            ev.venue,
                            style: TextStyle(
                              color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
                              fontSize: 11,
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
              IconButton(
                icon: const Icon(Icons.bookmark_remove_rounded, color: AppColors.coral, size: 22),
                tooltip: 'Remove bookmark',
                onPressed: () async {
                  await HuddleService.instance.toggleBookmark('event', ev.id ?? 1);
                  _load();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCommunitiesTab(bool isDark) {
    if (_bookmarkedCommunities.isEmpty) {
      return const EmptyStateView(
        icon: Icons.bookmark_border_rounded,
        title: 'No Saved Communities',
        message: 'Bookmark active clubs and student chapters to track their updates and meetups.',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      itemCount: _bookmarkedCommunities.length,
      itemBuilder: (context, index) {
        final comm = _bookmarkedCommunities[index];
        return HuddleCard(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => CommunityDetailScreen(community: comm)),
            );
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  comm.iconUrl ?? 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=300',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comm.name,
                      style: TextStyle(
                        color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${comm.memberCount} members • ${comm.category}',
                      style: TextStyle(
                        color: isDark ? AppColors.textDim : AppColors.textDarkMuted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.bookmark_remove_rounded, color: AppColors.coral, size: 22),
                tooltip: 'Remove bookmark',
                onPressed: () async {
                  await HuddleService.instance.toggleBookmark('community', comm.id ?? 1);
                  _load();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
