import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import 'package:intl/intl.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/huddle_button.dart';
import '../../core/widgets/huddle_card.dart';
import '../../core/widgets/state_views.dart';
import '../chat/chat_screen.dart';

class StudyRequestsScreen extends StatefulWidget {
  const StudyRequestsScreen({super.key});

  @override
  State<StudyRequestsScreen> createState() => _StudyRequestsScreenState();
}

class _StudyRequestsScreenState extends State<StudyRequestsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<StudyRequest> _incoming = [];
  List<StudyRequest> _outgoing = [];
  List<StudyRequest> _accepted = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadRequests();
  }

  void _loadRequests() async {
    setState(() => _isLoading = true);
    final inReq = await HuddleService.instance.getIncomingRequests();
    final outReq = await HuddleService.instance.getOutgoingRequests();
    final accReq = await HuddleService.instance.getAcceptedRequests();

    if (!mounted) return;
    setState(() {
      _incoming = inReq;
      _outgoing = outReq;
      _accepted = accReq;
      _isLoading = false;
    });
  }

  void _respond(StudyRequest req, String status) async {
    await HuddleService.instance.respondToRequest(req.id ?? 1, status);
    _loadRequests();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(status == 'accepted' ? 'Study request accepted! You are now connected.' : 'Request updated.'),
        backgroundColor: status == 'accepted' ? AppColors.cyanDark : AppColors.coral,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
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
          'Study Requests',
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
            Tab(text: 'Incoming (${_incoming.length})'),
            Tab(text: 'Outgoing (${_outgoing.length})'),
            Tab(text: 'Accepted (${_accepted.length})'),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? null : AppColors.glassBackgroundGradient,
        ),
        child: _isLoading
            ? const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    LoadingSkeleton(height: 110),
                    SizedBox(height: 16),
                    LoadingSkeleton(height: 110),
                  ],
                ),
              )
            : TabBarView(
                controller: _tabController,
                children: [
                  _buildIncomingTab(isDark),
                  _buildOutgoingTab(isDark),
                  _buildAcceptedTab(isDark),
                ],
              ),
      ),
    );
  }

  Widget _buildIncomingTab(bool isDark) {
    if (_incoming.isEmpty) {
      return const EmptyStateView(
        icon: Icons.mark_email_read_rounded,
        title: 'No Incoming Requests',
        message: 'You have caught up with all incoming study requests! Discover new buddies to connect.',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      itemCount: _incoming.length,
      itemBuilder: (context, index) {
        final req = _incoming[index];
        return HuddleCard(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      req.senderAvatar ?? 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          req.senderName ?? 'Student',
                          style: TextStyle(
                            color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          req.senderCourse ?? 'B.Tech Computer Science',
                          style: const TextStyle(color: AppColors.cyanDark, fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    DateFormat('MMM d').format(req.createdAt),
                    style: TextStyle(color: isDark ? AppColors.textDim : AppColors.textDarkSubtle, fontSize: 11),
                  ),
                ],
              ),
              if (req.message != null && req.message!.isNotEmpty) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.navySurfaceDark : AppColors.cyanPillBg.withAlpha(80),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                  ),
                  child: Text(
                    '"${req.message}"',
                    style: TextStyle(
                      color: isDark ? AppColors.textMuted : AppColors.textDarkBody,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: HuddleButton(
                      height: 40,
                      text: 'Accept',
                      icon: Icons.check_rounded,
                      onPressed: () => _respond(req, 'accepted'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: HuddleButton(
                      height: 40,
                      text: 'Decline',
                      icon: Icons.close_rounded,
                      variant: HuddleButtonVariant.outline,
                      customColor: AppColors.coral,
                      onPressed: () => _respond(req, 'declined'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOutgoingTab(bool isDark) {
    if (_outgoing.isEmpty) {
      return const EmptyStateView(
        icon: Icons.send_rounded,
        title: 'No Outgoing Requests',
        message: 'You haven’t sent any study requests yet. Browse the discovery feed to invite study partners!',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      itemCount: _outgoing.length,
      itemBuilder: (context, index) {
        final req = _outgoing[index];
        return HuddleCard(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'To: ${req.receiverName ?? "Study Buddy"}',
                    style: TextStyle(
                      color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.amber.withAlpha(25),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.amber.withAlpha(90)),
                    ),
                    child: const Text(
                      'PENDING',
                      style: TextStyle(color: AppColors.amber, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '"${req.message}"',
                style: TextStyle(
                  color: isDark ? AppColors.textMuted : AppColors.textDarkBody,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sent ${DateFormat('MMM d, hh:mm a').format(req.createdAt)}',
                    style: TextStyle(color: isDark ? AppColors.textDim : AppColors.textDarkSubtle, fontSize: 11),
                  ),
                  TextButton(
                    onPressed: () => _respond(req, 'cancelled'),
                    child: const Text('Cancel Request', style: TextStyle(color: AppColors.coral, fontSize: 12, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAcceptedTab(bool isDark) {
    if (_accepted.isEmpty) {
      return const EmptyStateView(
        icon: Icons.handshake_rounded,
        title: 'No Accepted Buddies Yet',
        message: 'When a study request is accepted, your study partner will appear here for direct collaboration!',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      itemCount: _accepted.length,
      itemBuilder: (context, index) {
        final req = _accepted[index];
        final partnerName = req.receiverName ?? req.senderName ?? 'Aarav Sharma';

        return HuddleCard(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(
                  req.senderAvatar ?? 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400',
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      partnerName,
                      style: TextStyle(
                        color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Row(
                      children: [
                        Icon(Icons.check_circle_rounded, color: AppColors.tealSuccess, size: 14),
                        SizedBox(width: 4),
                        Text('Study Partners', style: TextStyle(color: AppColors.tealSuccess, fontSize: 12, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
              HuddleButton(
                height: 40,
                text: 'Chat',
                icon: Icons.chat_bubble_outline_rounded,
                onPressed: () {
                  final partner = Student(
                    id: req.receiverId == 1 ? req.senderId : req.receiverId,
                    fullName: partnerName,
                    email: 'partner@iitb.ac.in',
                    college: 'IIT Bombay',
                    course: 'B.Tech Computer Science',
                    year: 3,
                    subjects: ['Algorithms', 'Data Structures', 'Machine Learning'],
                    interests: ['Competitive Programming', 'Hackathons'],
                    studyMode: 'hybrid',
                    studyTime: 'night',
                    studyStyle: 'pair',
                    avatarUrl: req.senderAvatar,
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ChatScreen(buddy: partner)),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
