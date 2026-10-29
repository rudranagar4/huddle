import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class NotificationEndpoint extends Endpoint {
  static final List<AppNotification> _notifications = [
    AppNotification(
      id: 1,
      studentId: 1,
      title: 'New Study Request',
      message: 'Sophia Martinez sent you a study request for Data Structures.',
      type: 'study_request',
      isRead: false,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    AppNotification(
      id: 2,
      studentId: 1,
      title: 'Study Request Accepted! 🎉',
      message: 'Maya Patel accepted your study request. You can now coordinate study hours!',
      type: 'request_accepted',
      isRead: false,
      createdAt: DateTime.now().subtract(const Duration(hours: 14)),
    ),
    AppNotification(
      id: 3,
      studentId: 1,
      title: 'Event Reminder: Build Arena 2026',
      message: 'Build Arena 2026 Hackathon starts in 3 days. Check your venue schedule.',
      type: 'event_reminder',
      isRead: true,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    AppNotification(
      id: 4,
      studentId: 1,
      title: 'GDSC Announcement',
      message: 'Serverpod Backend Workshop slide deck and assets are now uploaded.',
      type: 'community_update',
      isRead: true,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  Future<List<AppNotification>> getNotifications(Session session, int studentId) async {
    return _notifications.where((n) => n.studentId == studentId).toList();
  }

  Future<bool> markAsRead(Session session, int notificationId) async {
    final item = _notifications.firstWhere((n) => n.id == notificationId, orElse: () => _notifications.first);
    item.isRead = true;
    return true;
  }

  Future<bool> markAllAsRead(Session session, int studentId) async {
    for (final n in _notifications.where((n) => n.studentId == studentId)) {
      n.isRead = true;
    }
    return true;
  }
}
