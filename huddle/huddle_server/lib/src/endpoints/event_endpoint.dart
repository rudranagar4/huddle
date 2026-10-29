import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class EventEndpoint extends Endpoint {
  static final List<CampusEvent> _events = [
    CampusEvent(
      id: 1,
      title: 'Build Arena 2026 Hackathon',
      description: '36-hour flagship campus hackathon featuring AI, Cloud, and Web3 tracks. Free food, mentor hours, and 10k prize pool!',
      organizer: 'Developer Student Club & ACM',
      category: 'Tech',
      date: DateTime.now().add(const Duration(days: 3)),
      time: '10:00 AM - 10:00 PM',
      venue: 'Auditorium Hall B & Innovation Lab',
      bannerUrl: 'https://images.unsplash.com/photo-1515187029135-18ee286d815b?w=800',
      totalSeats: 150,
      registeredSeats: 112,
      isFree: true,
      price: 0,
    ),
    CampusEvent(
      id: 2,
      title: 'Workshop: Serverpod & Fullstack Dart',
      description: 'Hands-on masterclass on building real-time microservices and scalable backends using Serverpod, PostgreSQL, and Flutter.',
      organizer: 'Flutter Student Circle',
      category: 'Workshop',
      date: DateTime.now().add(const Duration(days: 5)),
      time: '3:00 PM - 5:30 PM',
      venue: 'Computer Center Lab 4',
      bannerUrl: 'https://images.unsplash.com/photo-1522071820081-009f0129c71c?w=800',
      totalSeats: 60,
      registeredSeats: 48,
      isFree: true,
      price: 0,
    ),
    CampusEvent(
      id: 3,
      title: 'Annual Campus Robowars & Drone Racing',
      description: 'Battle of custom combat bots and obstacle course drone races. Open for all engineering students to compete or spectate.',
      organizer: 'Robotics Society',
      category: 'Tech',
      date: DateTime.now().add(const Duration(days: 9)),
      time: '1:00 PM - 6:00 PM',
      venue: 'Sports Complex Arena',
      bannerUrl: 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=800',
      totalSeats: 250,
      registeredSeats: 195,
      isFree: false,
      price: 150.0,
    ),
    CampusEvent(
      id: 4,
      title: 'Acoustic Unplugged Night',
      description: 'An evening of live indie music, acoustic jam sessions, and poetry under the campus starry night.',
      organizer: 'Music & Cultural Club',
      category: 'Cultural',
      date: DateTime.now().add(const Duration(days: 12)),
      time: '6:30 PM - 9:30 PM',
      venue: 'Open Air Amphitheatre',
      bannerUrl: 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=800',
      totalSeats: 200,
      registeredSeats: 180,
      isFree: true,
      price: 0,
    ),
  ];

  static final List<EventRegistration> _registrations = [
    EventRegistration(
      id: 1,
      eventId: 1,
      studentId: 1,
      registeredAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  Future<List<CampusEvent>> getEvents(
    Session session, {
    String? category,
    String? search,
  }) async {
    try {
      final dbList = await CampusEvent.db.find(session);
      if (dbList.isNotEmpty) {
        return _filterEvents(dbList, category, search);
      }
    } catch (_) {}
    return _filterEvents(_events, category, search);
  }

  List<CampusEvent> _filterEvents(List<CampusEvent> list, String? category, String? search) {
    return list.where((e) {
      if (category != null && category.isNotEmpty && category != 'All' && e.category.toLowerCase() != category.toLowerCase()) {
        return false;
      }
      if (search != null && search.isNotEmpty) {
        final query = search.toLowerCase();
        final matches = e.title.toLowerCase().contains(query) ||
            e.description.toLowerCase().contains(query) ||
            e.venue.toLowerCase().contains(query);
        if (!matches) return false;
      }
      return true;
    }).toList();
  }

  Future<CampusEvent?> getEventDetails(Session session, int eventId) async {
    try {
      final event = await CampusEvent.db.findById(session, eventId);
      if (event != null) return event;
    } catch (_) {}
    return _events.firstWhere((e) => e.id == eventId, orElse: () => _events.first);
  }

  Future<bool> registerForEvent(Session session, int eventId, int studentId) async {
    // Check if already registered
    final alreadyRegistered = _registrations.any((r) => r.eventId == eventId && r.studentId == studentId);
    if (alreadyRegistered) return true;

    try {
      final reg = EventRegistration(
        eventId: eventId,
        studentId: studentId,
        registeredAt: DateTime.now(),
      );
      await EventRegistration.db.insertRow(session, reg);

      final event = await CampusEvent.db.findById(session, eventId);
      if (event != null) {
        event.registeredSeats += 1;
        await CampusEvent.db.updateRow(session, event);
      }
    } catch (_) {}

    _registrations.add(
      EventRegistration(
        id: _registrations.length + 1,
        eventId: eventId,
        studentId: studentId,
        registeredAt: DateTime.now(),
      ),
    );

    final event = _events.firstWhere((e) => e.id == eventId, orElse: () => _events.first);
    event.registeredSeats += 1;
    return true;
  }

  Future<bool> unregisterFromEvent(Session session, int eventId, int studentId) async {
    try {
      final regs = await EventRegistration.db.find(
        session,
        where: (t) => t.eventId.equals(eventId) & t.studentId.equals(studentId),
      );
      if (regs.isNotEmpty) {
        await EventRegistration.db.deleteRow(session, regs.first);
        final event = await CampusEvent.db.findById(session, eventId);
        if (event != null && event.registeredSeats > 0) {
          event.registeredSeats -= 1;
          await CampusEvent.db.updateRow(session, event);
        }
      }
    } catch (_) {}

    _registrations.removeWhere((r) => r.eventId == eventId && r.studentId == studentId);
    final event = _events.firstWhere((e) => e.id == eventId, orElse: () => _events.first);
    if (event.registeredSeats > 0) {
      event.registeredSeats -= 1;
    }
    return true;
  }

  Future<List<CampusEvent>> getMyRegisteredEvents(Session session, int studentId) async {
    final registeredIds = _registrations.where((r) => r.studentId == studentId).map((r) => r.eventId).toSet();
    return _events.where((e) => registeredIds.contains(e.id)).toList();
  }
}
