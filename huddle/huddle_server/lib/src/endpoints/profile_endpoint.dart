import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ProfileEndpoint extends Endpoint {
  // In-memory cache/seed store to ensure zero downtime and reliable local demos
  static final List<Student> _seedStudents = [
    Student(
      id: 1,
      userId: 1,
      fullName: 'Alex Chen',
      email: 'alex.chen@campus.edu',
      college: 'Tech Institute of Engineering',
      course: 'Computer Science',
      year: 3,
      bio: 'Algorithms enthusiast, competitive coder, and late-night builder. Looking for study partners for DSA & System Design.',
      avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400',
      subjects: ['Data Structures', 'Operating Systems', 'Algorithms'],
      interests: ['Competitive Programming', 'Open Source', 'Hackathons'],
      studyMode: 'hybrid',
      studyTime: 'night',
      studyStyle: 'group',
    ),
    Student(
      id: 2,
      userId: 2,
      fullName: 'Sophia Martinez',
      email: 'sophia.m@campus.edu',
      college: 'Tech Institute of Engineering',
      course: 'Information Technology',
      year: 3,
      bio: 'Machine learning researcher and UI designer. Love discussing neural architectures and Flutter state management.',
      avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400',
      subjects: ['Machine Learning', 'Data Structures', 'Web Development'],
      interests: ['AI Research', 'Flutter', 'UI/UX Design'],
      studyMode: 'online',
      studyTime: 'morning',
      studyStyle: 'both',
    ),
    Student(
      id: 3,
      userId: 3,
      fullName: 'Rohan Sharma',
      email: 'rohan.s@campus.edu',
      college: 'City University College',
      course: 'Computer Science',
      year: 2,
      bio: 'Fullstack web enthusiast (React, Flutter, Serverpod). Always ready to brainstorm app ideas and solve DBMS problems.',
      avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
      subjects: ['Database Systems', 'Web Development', 'Computer Networks'],
      interests: ['Cloud Tech', 'Serverpod', 'Startup Pitching'],
      studyMode: 'offline',
      studyTime: 'flexible',
      studyStyle: 'group',
    ),
    Student(
      id: 4,
      userId: 4,
      fullName: 'Maya Patel',
      email: 'maya.p@campus.edu',
      college: 'Tech Institute of Engineering',
      course: 'Computer Science',
      year: 4,
      bio: 'Senior year student preparing for GRE and Tech Interviews. Need focused partner for Leetcode and mock interviews.',
      avatarUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=400',
      subjects: ['Algorithms', 'System Design', 'Cybersecurity'],
      interests: ['Competitive Programming', 'Fintech', 'Reading'],
      studyMode: 'hybrid',
      studyTime: 'night',
      studyStyle: 'solo',
    ),
  ];

  Future<Student?> getProfile(Session session, int studentId) async {
    try {
      final student = await Student.db.findById(session, studentId);
      if (student != null) return student;
    } catch (_) {}
    return _seedStudents.firstWhere(
      (s) => s.id == studentId,
      orElse: () => _seedStudents.first,
    );
  }

  Future<Student> getMyProfile(Session session) async {
    try {
      final all = await Student.db.find(session, limit: 1);
      if (all.isNotEmpty) return all.first;
    } catch (_) {}
    return _seedStudents.first;
  }

  Future<Student> createOrUpdateProfile(Session session, Student student) async {
    try {
      if (student.id != null) {
        return await Student.db.updateRow(session, student);
      } else {
        return await Student.db.insertRow(session, student);
      }
    } catch (_) {
      final idx = _seedStudents.indexWhere((s) => s.id == student.id);
      if (idx >= 0) {
        _seedStudents[idx] = student;
      } else {
        final newStudent = student.copyWith(id: _seedStudents.length + 1);
        _seedStudents.add(newStudent);
        return newStudent;
      }
      return student;
    }
  }

  Future<List<Student>> getAllStudents(
    Session session, {
    String? course,
    int? year,
    String? subject,
  }) async {
    try {
      final dbStudents = await Student.db.find(session);
      if (dbStudents.isNotEmpty) {
        return _filterStudents(dbStudents, course, year, subject);
      }
    } catch (_) {}
    return _filterStudents(_seedStudents, course, year, subject);
  }

  List<Student> _filterStudents(
    List<Student> list,
    String? course,
    int? year,
    String? subject,
  ) {
    return list.where((s) {
      if (course != null && course.isNotEmpty && !s.course.toLowerCase().contains(course.toLowerCase())) {
        return false;
      }
      if (year != null && s.year != year) {
        return false;
      }
      if (subject != null && subject.isNotEmpty) {
        final matches = s.subjects.any((sub) => sub.toLowerCase().contains(subject.toLowerCase()));
        if (!matches) return false;
      }
      return true;
    }).toList();
  }
}
