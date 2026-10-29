import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/campus_top_bar.dart';
import '../../core/widgets/huddle_card.dart';
import '../../core/widgets/state_views.dart';
import 'community_detail_screen.dart';

class CommunitiesTab extends StatefulWidget {
  const CommunitiesTab({super.key});

  @override
  State<CommunitiesTab> createState() => _CommunitiesTabState();
}

class _CommunitiesTabState extends State<CommunitiesTab> {
  final TextEditingController _searchController = TextEditingController();
  List<Community> _communities = [];
  String _selectedCategory = 'All';
  bool _isLoading = true;

  final List<String> _categories = ['All', 'Tech', 'Coding', 'Robotics', 'Business'];

  @override
  void initState() {
    super.initState();
    _loadCommunities();
  }

  void _loadCommunities() async {
    setState(() => _isLoading = true);
    final list = await HuddleService.instance.getCommunities(
      category: _selectedCategory,
      search: _searchController.text.trim(),
    );
    if (!mounted) return;
    setState(() {
      _communities = list;
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

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => _loadCommunities(),
          color: AppColors.cyanBrand,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top App Bar
                const CampusTopBar(),

                const SizedBox(height: 12),

                // Title Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.hub_rounded, size: 14, color: AppColors.cyanBrand),
                          SizedBox(width: 5),
                          Text(
                            'CAMPUS HUBS & CIRCLES',
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
                        'Student Communities',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Search Bar
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
                      onChanged: (_) => _loadCommunities(),
                      decoration: InputDecoration(
                        hintText: 'Search coding clubs, robotics, societies...',
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
                                  _loadCommunities();
                                },
                              ),
                            const Icon(Icons.mic_none_rounded, color: Color(0xFF94A3B8), size: 20),
                            const SizedBox(width: 8),
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

                const SizedBox(height: 14),

                // Category Chips
                SizedBox(
                  height: 38,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _categories.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final cat = _categories[index];
                      final isSelected = _selectedCategory == cat;

                      if (isSelected) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: AppColors.cyanActionGradient,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.cyanBrand.withAlpha(90),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              cat,
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
                          setState(() => _selectedCategory = cat);
                          _loadCommunities();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                              cat,
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

                // Communities List
                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: LoadingSkeleton(height: 240),
                  )
                else if (_communities.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: EmptyStateView(
                      icon: Icons.group_off_rounded,
                      title: 'No Communities Found',
                      message: 'Try clearing your search term or selecting "All" categories.',
                      actionText: 'Reset',
                      onAction: () {
                        setState(() {
                          _selectedCategory = 'All';
                          _searchController.clear();
                        });
                        _loadCommunities();
                      },
                    ),
                  )
                else
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    itemCount: _communities.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return _buildCommunityCard(_communities[index], isDark);
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCommunityCard(Community comm, bool isDark) {
    final isJoined = HuddleService.instance.isCommunityJoined(comm.id ?? 1);

    return HuddleCard(
      padding: EdgeInsets.zero,
      borderRadius: 24,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CommunityDetailScreen(community: comm)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Image
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: Image.network(
                  comm.bannerUrl ?? '',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    height: 120,
                    color: const Color(0xFF1E293B),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(220),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    comm.category.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w800,
                      color: AppColors.cyanDark,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comm.name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '👥 ${comm.memberCount} Members • 🚀 ${comm.upcomingEventsCount} Active Sprints',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: isDark ? AppColors.textMuted : AppColors.textDarkMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Join/Leave Button
                    Container(
                      height: 38,
                      decoration: BoxDecoration(
                        gradient: isJoined ? null : AppColors.cyanActionGradient,
                        color: isJoined ? (isDark ? const Color(0xFF1E293B) : const Color(0xFFDCFCE7)) : null,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          await HuddleService.instance.toggleCommunityMembership(comm.id ?? 1);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        ),
                        child: Text(
                          isJoined ? 'Joined ✓' : '+ Join',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w800,
                            color: isJoined ? AppColors.mintText : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  comm.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: isDark ? AppColors.textWhite : AppColors.textDarkBody,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
