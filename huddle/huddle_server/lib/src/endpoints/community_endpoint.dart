import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class CommunityEndpoint extends Endpoint {
  static final List<Community> _communities = [
    Community(
      id: 1,
      name: 'Google Developer Student Club',
      category: 'Coding',
      description: 'The epicenter of builders, hackathon teams, and mobile/web development on campus. We host code sprints, study jams, and project showcases.',
      iconUrl: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=300',
      bannerUrl: 'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=800',
      memberCount: 420,
      upcomingEventsCount: 3,
    ),
    Community(
      id: 2,
      name: 'Campus AI & Robotics Club',
      category: 'Robotics',
      description: 'Designing autonomous rovers, drones, and computer vision models. Hands-on hardware labs and competitive robotics tournaments.',
      iconUrl: 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=300',
      bannerUrl: 'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=800',
      memberCount: 280,
      upcomingEventsCount: 2,
    ),
    Community(
      id: 3,
      name: 'UI/UX & Product Design Guild',
      category: 'Design',
      description: 'Figma critiques, design systems, usability teardowns, and user research. Learn to design high-converting, stunning digital experiences.',
      iconUrl: 'https://images.unsplash.com/photo-1561070791-2526d30994b5?w=300',
      bannerUrl: 'https://images.unsplash.com/photo-1542744094-24638eff58bb?w=800',
      memberCount: 195,
      upcomingEventsCount: 1,
    ),
    Community(
      id: 4,
      name: 'Competitive Programming Cell',
      category: 'Coding',
      description: 'Weekly contests on Codeforces, LeetCode virtual contests, and algorithmic problem-solving sessions for placement & ICPC aspirants.',
      iconUrl: 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=300',
      bannerUrl: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=800',
      memberCount: 350,
      upcomingEventsCount: 4,
    ),
    Community(
      id: 5,
      name: 'Campus Music & Jam Society',
      category: 'Music',
      description: 'Musicians, vocalists, acoustic players, and music producers. Regular campus jam sessions, band formations, and open mics.',
      iconUrl: 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=300',
      bannerUrl: 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=800',
      memberCount: 210,
      upcomingEventsCount: 2,
    ),
  ];

  static final List<CommunityMember> _members = [
    CommunityMember(
      id: 1,
      communityId: 1,
      studentId: 1,
      joinedAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    CommunityMember(
      id: 2,
      communityId: 4,
      studentId: 1,
      joinedAt: DateTime.now().subtract(const Duration(days: 15)),
    ),
  ];

  static final List<CommunityPost> _posts = [
    CommunityPost(
      id: 1,
      communityId: 1,
      authorName: 'Alex Chen',
      authorAvatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400',
      title: 'Looking for a Flutter developer for Hackathon team!',
      content: 'Hey everyone, our team needs 1 more teammate proficient in Flutter and state management for the Build Arena hackathon. Ping me if interested!',
      createdAt: DateTime.now().subtract(const Duration(hours: 4)),
      likesCount: 14,
    ),
    CommunityPost(
      id: 2,
      communityId: 1,
      authorName: 'GDSC Lead',
      authorAvatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400',
      title: 'Serverpod Backend Workshop Slides Released',
      content: 'The slide deck and GitHub sample repo for yesterday’s session are now available in the resources tab. Great job everyone who deployed their first endpoint!',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      likesCount: 28,
    ),
  ];

  Future<List<Community>> getCommunities(
    Session session, {
    String? category,
    String? search,
  }) async {
    try {
      final dbList = await Community.db.find(session);
      if (dbList.isNotEmpty) {
        return _filterCommunities(dbList, category, search);
      }
    } catch (_) {}
    return _filterCommunities(_communities, category, search);
  }

  List<Community> _filterCommunities(List<Community> list, String? category, String? search) {
    return list.where((c) {
      if (category != null && category.isNotEmpty && category != 'All' && c.category.toLowerCase() != category.toLowerCase()) {
        return false;
      }
      if (search != null && search.isNotEmpty) {
        final query = search.toLowerCase();
        final matches = c.name.toLowerCase().contains(query) ||
            c.description.toLowerCase().contains(query);
        if (!matches) return false;
      }
      return true;
    }).toList();
  }

  Future<Community?> getCommunityDetails(Session session, int communityId) async {
    try {
      final item = await Community.db.findById(session, communityId);
      if (item != null) return item;
    } catch (_) {}
    return _communities.firstWhere((c) => c.id == communityId, orElse: () => _communities.first);
  }

  Future<bool> joinCommunity(Session session, int communityId, int studentId) async {
    final alreadyMember = _members.any((m) => m.communityId == communityId && m.studentId == studentId);
    if (alreadyMember) return true;

    try {
      final member = CommunityMember(
        communityId: communityId,
        studentId: studentId,
        joinedAt: DateTime.now(),
      );
      await CommunityMember.db.insertRow(session, member);

      final comm = await Community.db.findById(session, communityId);
      if (comm != null) {
        comm.memberCount += 1;
        await Community.db.updateRow(session, comm);
      }
    } catch (_) {}

    _members.add(
      CommunityMember(
        id: _members.length + 1,
        communityId: communityId,
        studentId: studentId,
        joinedAt: DateTime.now(),
      ),
    );

    final comm = _communities.firstWhere((c) => c.id == communityId, orElse: () => _communities.first);
    comm.memberCount += 1;
    return true;
  }

  Future<bool> leaveCommunity(Session session, int communityId, int studentId) async {
    try {
      final members = await CommunityMember.db.find(
        session,
        where: (t) => t.communityId.equals(communityId) & t.studentId.equals(studentId),
      );
      if (members.isNotEmpty) {
        await CommunityMember.db.deleteRow(session, members.first);
        final comm = await Community.db.findById(session, communityId);
        if (comm != null && comm.memberCount > 0) {
          comm.memberCount -= 1;
          await Community.db.updateRow(session, comm);
        }
      }
    } catch (_) {}

    _members.removeWhere((m) => m.communityId == communityId && m.studentId == studentId);
    final comm = _communities.firstWhere((c) => c.id == communityId, orElse: () => _communities.first);
    if (comm.memberCount > 0) {
      comm.memberCount -= 1;
    }
    return true;
  }

  Future<List<Community>> getMyCommunities(Session session, int studentId) async {
    final joinedIds = _members.where((m) => m.studentId == studentId).map((m) => m.communityId).toSet();
    return _communities.where((c) => joinedIds.contains(c.id)).toList();
  }

  Future<List<CommunityPost>> getCommunityPosts(Session session, int communityId) async {
    return _posts.where((p) => p.communityId == communityId).toList();
  }

  Future<CommunityPost> addCommunityPost(Session session, CommunityPost post) async {
    final newPost = post.copyWith(
      id: _posts.length + 1,
      createdAt: DateTime.now(),
    );
    _posts.insert(0, newPost);
    return newPost;
  }
}
