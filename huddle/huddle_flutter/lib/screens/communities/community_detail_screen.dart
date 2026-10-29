import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import 'package:intl/intl.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/huddle_button.dart';
import '../../core/widgets/huddle_card.dart';
import '../../core/widgets/state_views.dart';

class CommunityDetailScreen extends StatefulWidget {
  final Community community;

  const CommunityDetailScreen({super.key, required this.community});

  @override
  State<CommunityDetailScreen> createState() => _CommunityDetailScreenState();
}

class _CommunityDetailScreenState extends State<CommunityDetailScreen> {
  late bool _isJoined;
  late int _memberCount;
  List<CommunityPost> _posts = [];
  bool _isLoadingPosts = true;
  bool _isProcessingJoin = false;

  @override
  void initState() {
    super.initState();
    _isJoined = HuddleService.instance.isCommunityJoined(widget.community.id ?? 1);
    _memberCount = widget.community.memberCount;
    _loadPosts();
  }

  void _loadPosts() async {
    final posts = await HuddleService.instance.getCommunityPosts(widget.community.id ?? 1);
    if (!mounted) return;
    setState(() {
      _posts = posts;
      _isLoadingPosts = false;
    });
  }

  void _toggleJoin() async {
    setState(() => _isProcessingJoin = true);
    final nowJoined = await HuddleService.instance.toggleCommunityMembership(widget.community.id ?? 1);
    if (!mounted) return;
    setState(() {
      _isJoined = nowJoined;
      _memberCount += nowJoined ? 1 : -1;
      _isProcessingJoin = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(nowJoined ? Icons.check_circle_rounded : Icons.info_outline_rounded, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text(nowJoined ? 'Welcome to ${widget.community.name}!' : 'Left community.'),
          ],
        ),
        backgroundColor: nowJoined ? AppColors.cyanDark : AppColors.coral,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  void _showCreatePostModal() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final titleController = TextEditingController();
    final contentController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isDark ? AppColors.navyCardDark : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 24,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New Discussion Post',
                  style: TextStyle(
                    color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: isDark ? AppColors.textDim : AppColors.textDarkMuted),
                  onPressed: () => Navigator.pop(ctx),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: titleController,
              style: TextStyle(
                color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                hintText: 'Post Title / Topic...',
                filled: true,
                fillColor: isDark ? AppColors.navySurfaceDark : AppColors.glassCardLightSolid,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: contentController,
              maxLines: 4,
              style: TextStyle(color: isDark ? AppColors.textWhite : AppColors.textDarkHeading),
              decoration: InputDecoration(
                hintText: 'Share ideas, ask questions, or form a project team...',
                filled: true,
                fillColor: isDark ? AppColors.navySurfaceDark : AppColors.glassCardLightSolid,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                ),
              ),
            ),
            const SizedBox(height: 20),
            HuddleButton(
              width: double.infinity,
              height: 48,
              text: 'Publish Post',
              icon: Icons.send_rounded,
              onPressed: () async {
                if (titleController.text.trim().isEmpty || contentController.text.trim().isEmpty) return;
                final newPost = await HuddleService.instance.addCommunityPost(
                  widget.community.id ?? 1,
                  titleController.text.trim(),
                  contentController.text.trim(),
                );
                if (!ctx.mounted) return;
                Navigator.pop(ctx);
                if (!mounted) return;
                setState(() => _posts.insert(0, newPost));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Post published!'),
                    backgroundColor: AppColors.cyanDark,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.community;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? null : AppColors.glassBackgroundGradient,
        ),
        child: CustomScrollView(
          slivers: [
            // Banner Sliver AppBar
            SliverAppBar(
              expandedHeight: 220,
              pinned: true,
              backgroundColor: isDark ? AppColors.navySurfaceDark : Colors.white,
              leading: IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.black.withAlpha(120), shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_back_ios_new_rounded, size: 16, color: Colors.white),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      c.bannerUrl ?? 'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=800',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            isDark
                                ? AppColors.navyBackgroundDark.withAlpha(240)
                                : Colors.black.withAlpha(140),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Details Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: isDark ? AppColors.cyanBrand.withAlpha(40) : AppColors.cyanPillBg,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.cyanBrand.withAlpha(80)),
                          ),
                          child: Text(
                            c.category.toUpperCase(),
                            style: const TextStyle(
                              color: AppColors.cyanDark,
                              fontWeight: FontWeight.w800,
                              fontSize: 11,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(Icons.people_outline_rounded, size: 16, color: isDark ? AppColors.textDim : AppColors.textDarkMuted),
                            const SizedBox(width: 4),
                            Text(
                              '$_memberCount members',
                              style: TextStyle(
                                color: isDark ? AppColors.textDim : AppColors.textDarkMuted,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      c.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      c.description,
                      style: TextStyle(
                        color: isDark ? AppColors.textMuted : AppColors.textDarkBody,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Join / Leave Button & Post Action
                    Row(
                      children: [
                        Expanded(
                          child: HuddleButton(
                            height: 48,
                            text: _isJoined ? 'Joined Community' : 'Join Community',
                            icon: _isJoined ? Icons.check_circle_rounded : Icons.group_add_rounded,
                            isLoading: _isProcessingJoin,
                            customColor: _isJoined ? AppColors.cyanDark : null,
                            onPressed: _toggleJoin,
                          ),
                        ),
                        const SizedBox(width: 10),
                        HuddleButton(
                          height: 48,
                          text: 'Post',
                          icon: Icons.add_comment_rounded,
                          variant: HuddleButtonVariant.outline,
                          onPressed: _showCreatePostModal,
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // Announcements & Posts Feed
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Community Feed',
                          style: TextStyle(
                            color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '${_posts.length} discussions',
                          style: TextStyle(
                            color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
            ),

            // Posts List
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              sliver: _isLoadingPosts
                  ? SliverToBoxAdapter(
                      child: Column(
                        children: const [
                          LoadingSkeleton(height: 110),
                          SizedBox(height: 12),
                          LoadingSkeleton(height: 110),
                        ],
                      ),
                    )
                  : _posts.isEmpty
                      ? SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Center(
                              child: Text(
                                'No discussions yet. Be the first to start a conversation!',
                                style: TextStyle(
                                  color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final post = _posts[index];
                              return HuddleCard(
                                margin: const EdgeInsets.only(bottom: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 16,
                                          backgroundImage: NetworkImage(
                                            post.authorAvatar ?? 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400',
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            post.authorName,
                                            style: TextStyle(
                                              color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          DateFormat('MMM d').format(post.createdAt),
                                          style: TextStyle(
                                            color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      post.title,
                                      style: TextStyle(
                                        color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      post.content,
                                      style: TextStyle(
                                        color: isDark ? AppColors.textMuted : AppColors.textDarkBody,
                                        fontSize: 13,
                                        height: 1.4,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        const Icon(Icons.favorite_rounded, size: 16, color: AppColors.coral),
                                        const SizedBox(width: 6),
                                        Text(
                                          '${post.likesCount} upvotes',
                                          style: TextStyle(
                                            color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            childCount: _posts.length,
                          ),
                        ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}
