import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import 'profile_endpoint.dart';

class StudyRequestEndpoint extends Endpoint {
  static final List<StudyRequest> _requests = [
    StudyRequest(
      id: 1,
      senderId: 2,
      receiverId: 1,
      message: 'Hey! Saw you are studying Data Structures. Want to prep together for the midterm next week?',
      status: 'pending',
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      senderName: 'Sophia Martinez',
      senderCourse: 'Information Technology, 3rd Year',
      senderAvatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400',
      receiverName: 'Alex Chen',
    ),
    StudyRequest(
      id: 2,
      senderId: 3,
      receiverId: 1,
      message: 'Looking for a study partner for Database Systems lab and query optimization.',
      status: 'pending',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      senderName: 'Rohan Sharma',
      senderCourse: 'Computer Science, 2nd Year',
      senderAvatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
      receiverName: 'Alex Chen',
    ),
    StudyRequest(
      id: 3,
      senderId: 1,
      receiverId: 4,
      message: 'Hi Maya! Let us practice LeetCode hard problems this weekend.',
      status: 'accepted',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      senderName: 'Alex Chen',
      senderCourse: 'Computer Science, 3rd Year',
      senderAvatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400',
      receiverName: 'Maya Patel',
    ),
  ];

  Future<StudyRequest> sendStudyRequest(
    Session session,
    int senderId,
    int receiverId,
    String? message,
  ) async {
    final profileEndpoint = ProfileEndpoint();
    final sender = await profileEndpoint.getProfile(session, senderId);
    final receiver = await profileEndpoint.getProfile(session, receiverId);

    final req = StudyRequest(
      id: _requests.length + 1,
      senderId: senderId,
      receiverId: receiverId,
      message: message ?? 'Would love to study together!',
      status: 'pending',
      createdAt: DateTime.now(),
      senderName: sender?.fullName ?? 'Student',
      senderCourse: '${sender?.course ?? "CS"}, Year ${sender?.year ?? 1}',
      senderAvatar: sender?.avatarUrl,
      receiverName: receiver?.fullName,
    );

    try {
      final inserted = await StudyRequest.db.insertRow(session, req);
      return inserted;
    } catch (_) {
      _requests.add(req);
      return req;
    }
  }

  Future<List<StudyRequest>> getIncomingRequests(Session session, int studentId) async {
    try {
      final dbList = await StudyRequest.db.find(
        session,
        where: (t) => t.receiverId.equals(studentId) & t.status.equals('pending'),
      );
      if (dbList.isNotEmpty) return dbList;
    } catch (_) {}
    return _requests.where((r) => r.receiverId == studentId && r.status == 'pending').toList();
  }

  Future<List<StudyRequest>> getOutgoingRequests(Session session, int studentId) async {
    try {
      final dbList = await StudyRequest.db.find(
        session,
        where: (t) => t.senderId.equals(studentId),
      );
      if (dbList.isNotEmpty) return dbList;
    } catch (_) {}
    return _requests.where((r) => r.senderId == studentId).toList();
  }

  Future<List<StudyRequest>> getAcceptedRequests(Session session, int studentId) async {
    try {
      final dbList = await StudyRequest.db.find(
        session,
        where: (t) =>
            (t.senderId.equals(studentId) | t.receiverId.equals(studentId)) &
            t.status.equals('accepted'),
      );
      if (dbList.isNotEmpty) return dbList;
    } catch (_) {}
    return _requests
        .where((r) => (r.senderId == studentId || r.receiverId == studentId) && r.status == 'accepted')
        .toList();
  }

  Future<bool> respondToRequest(Session session, int requestId, String newStatus) async {
    try {
      final req = await StudyRequest.db.findById(session, requestId);
      if (req != null) {
        req.status = newStatus;
        await StudyRequest.db.updateRow(session, req);
        return true;
      }
    } catch (_) {}

    final idx = _requests.indexWhere((r) => r.id == requestId);
    if (idx >= 0) {
      _requests[idx].status = newStatus;
      return true;
    }
    return false;
  }
}
