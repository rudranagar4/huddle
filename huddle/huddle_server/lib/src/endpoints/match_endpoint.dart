import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import 'profile_endpoint.dart';

class MatchEndpoint extends Endpoint {
  Future<List<MatchResult>> getSuggestedMatches(Session session, int currentStudentId) async {
    final profileEndpoint = ProfileEndpoint();
    final allStudents = await profileEndpoint.getAllStudents(session);
    final currentStudent = await profileEndpoint.getProfile(session, currentStudentId) ?? allStudents.first;

    final results = <MatchResult>[];

    for (final other in allStudents) {
      if (other.id == currentStudentId) continue;

      final sharedSubs = other.subjects.where((s) => currentStudent.subjects.contains(s)).toList();
      final sharedInts = other.interests.where((i) => currentStudent.interests.contains(i)).toList();

      int score = 40; // baseline
      score += sharedSubs.length * 15;
      score += sharedInts.length * 10;

      if (other.course.toLowerCase() == currentStudent.course.toLowerCase()) {
        score += 15;
      }
      if (other.year == currentStudent.year) {
        score += 10;
      }
      if (other.studyMode == currentStudent.studyMode || other.studyMode == 'hybrid') {
        score += 10;
      }
      if (other.studyTime == currentStudent.studyTime || other.studyTime == 'flexible') {
        score += 10;
      }
      if (other.studyStyle == currentStudent.studyStyle || other.studyStyle == 'both') {
        score += 10;
      }

      if (score > 98) score = 98;
      if (score < 55) score = 55 + (other.id ?? 1) % 15;

      final reasons = <String>[];
      if (sharedSubs.isNotEmpty) {
        reasons.add('Both study ${sharedSubs.first}');
      }
      if (sharedInts.isNotEmpty) {
        reasons.add('Shared interest in ${sharedInts.first}');
      }
      if (other.studyTime == currentStudent.studyTime) {
        reasons.add('Prefers ${other.studyTime} sessions');
      }

      results.add(
        MatchResult(
          student: other,
          matchScore: score,
          sharedSubjects: sharedSubs,
          sharedInterests: sharedInts,
          compatibilityReason: reasons.isNotEmpty ? reasons.join(' • ') : 'Compatible schedule & course',
        ),
      );
    }

    results.sort((a, b) => b.matchScore.compareTo(a.matchScore));
    return results;
  }
}
