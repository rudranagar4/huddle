import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import 'package:intl/intl.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/huddle_card.dart';
import '../../core/widgets/state_views.dart';
import '../study_buddies/study_requests_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<AppNotification> _notifications = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    setState(() => _isLoading = true);
    final list = await HuddleService.instance.getNotifications();
    if (!mounted) return;
    setState(() {
      _notifications = list;
      _isLoading = false;
    });
  }

  void _markAllAsRead() async {
    await HuddleService.instance.markAllNotificationsRead();
    if (!mounted) return;
    setState(() {
      for (var n in _notifications) {
        n.isRead = true;
      }
    });
    HuddleService.instance.unreadNotificationsCount.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    final unread = _notifications.where((n) => !n.isRead).length;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      appBar: AppBar(
        title: Text(
          'Notifications',
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
        actions: [
          if (unread > 0)
            TextButton(
              onPressed: _markAllAsRead,
              child: const Text(
                'Mark All Read',
                style: TextStyle(color: AppColors.cyanDark, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(width: 8),
        ],
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
                    LoadingSkeleton(height: 90),
                    SizedBox(height: 12),
                    LoadingSkeleton(height: 90),
                  ],
                ),
              )
            : _notifications.isEmpty
                ? const EmptyStateView(
                    icon: Icons.notifications_none_rounded,
                    title: 'No Notifications',
                    message: 'You have no alerts right now. We will notify you when study partners reach out!',
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                    itemCount: _notifications.length,
                    itemBuilder: (context, index) {
                      final item = _notifications[index];

                      IconData icon = Icons.notifications_active_rounded;
                      Color iconCol = AppColors.cyanDark;
                      if (item.type == 'study_request') {
                        icon = Icons.person_add_rounded;
                        iconCol = AppColors.cyanDark;
                      } else if (item.type == 'request_accepted') {
                        icon = Icons.handshake_rounded;
                        iconCol = AppColors.tealSuccess;
                      } else if (item.type == 'event_reminder') {
                        icon = Icons.event_available_rounded;
                        iconCol = AppColors.amber;
                      }

                      return HuddleCard(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(14),
                        border: item.isRead
                            ? null
                            : Border.all(color: AppColors.cyanBrand.withAlpha(isDark ? 100 : 120), width: 1.5),
                        onTap: () {
                          setState(() {
                            item.isRead = true;
                            HuddleService.instance.unreadNotificationsCount.value =
                                _notifications.where((n) => !n.isRead).length;
                          });
                          if (item.type == 'study_request' || item.type == 'request_accepted') {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const StudyRequestsScreen()),
                            );
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: iconCol.withAlpha(25),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(icon, color: iconCol, size: 20),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.title,
                                          style: TextStyle(
                                            color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                                            fontWeight: item.isRead ? FontWeight.w600 : FontWeight.w800,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        DateFormat('MMM d').format(item.createdAt),
                                        style: TextStyle(
                                          color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.message,
                                    style: TextStyle(
                                      color: isDark ? AppColors.textMuted : AppColors.textDarkBody,
                                      fontSize: 13,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
