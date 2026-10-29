import 'dart:async';
import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import '../../main.dart' as app;

class HuddleService {
  static final HuddleService instance = HuddleService._();
  HuddleService._();

  // Current session & active student: Rudra (Data Science Student at IIT Bombay)
  Student _currentStudent = Student(
    id: 1,
    userId: 1,
    fullName: 'Rudra Patel',
    email: 'rudra.patel@iitb.ac.in',
    college: 'IIT Bombay',
    course: 'B.Tech Data Science & AI',
    year: 3,
    bio: 'Data Science & Machine Learning enthusiast at IIT Bombay. Building agentic AI apps and fine-tuning LLMs. Always down for hackathons, Kaggle sprints, and late-night LeetCode!',
    avatarUrl: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?auto=format&fit=crop&q=80&w=400',
    subjects: ['Data Science', 'Machine Learning', 'Algorithms', 'Deep Learning', 'Database Systems'],
    interests: ['Smart India Hackathon', 'Generative AI', 'Competitive Coding', 'Techfest IITB'],
    studyMode: 'hybrid',
    studyTime: 'night',
    studyStyle: 'pair',
  );

  bool _isLoggedIn = true;
  // Default to the glassmorphic light theme as featured in the reference design
  final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier<ThemeMode>(ThemeMode.light);
  final ValueNotifier<int> unreadNotificationsCount = ValueNotifier<int>(3);

  Student get currentStudent => _currentStudent;
  bool get isLoggedIn => _isLoggedIn;

  void toggleTheme() {
    if (themeModeNotifier.value == ThemeMode.dark) {
      themeModeNotifier.value = ThemeMode.light;
    } else {
      themeModeNotifier.value = ThemeMode.dark;
    }
  }

  // --- Auth & Profile ---
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 600));
    _isLoggedIn = true;
    return true;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _isLoggedIn = false;
  }

  Future<Student> register({
    required String fullName,
    required String email,
    required String college,
    required String course,
    required int year,
    required List<String> subjects,
    required List<String> interests,
    required String studyMode,
    required String studyTime,
    required String studyStyle,
  }) async {
    final student = Student(
      id: 1,
      userId: 1,
      fullName: fullName,
      email: email,
      college: college,
      course: course,
      year: year,
      bio: 'Data Science Student at $college',
      avatarUrl: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?auto=format&fit=crop&q=80&w=400',
      subjects: subjects,
      interests: interests,
      studyMode: studyMode,
      studyTime: studyTime,
      studyStyle: studyStyle,
    );

    try {
      final res = await app.client.profile.createOrUpdateProfile(student);
      _currentStudent = res;
    } catch (_) {
      _currentStudent = student;
    }
    _isLoggedIn = true;
    return _currentStudent;
  }

  Future<Student> updateProfile(Student updated) async {
    try {
      final res = await app.client.profile.createOrUpdateProfile(updated);
      _currentStudent = res;
    } catch (_) {
      _currentStudent = updated;
    }
    return _currentStudent;
  }

  Future<Student?> getProfile(int studentId) async {
    try {
      final res = await app.client.profile.getProfile(studentId);
      if (res != null) return res;
    } catch (_) {}
    return _currentStudent;
  }

  // --- Study Buddies & Matching (Indian Peer Students & Match Cards) ---
  Future<List<MatchResult>> getSuggestedMatches() async {
    try {
      final res = await app.client.match.getSuggestedMatches(_currentStudent.id ?? 1);
      if (res.isNotEmpty) return res;
    } catch (_) {}

    return [
      MatchResult(
        student: Student(
          id: 2,
          userId: 2,
          fullName: 'Aarav Sharma',
          email: 'aarav.sharma@iitb.ac.in',
          college: 'IIT Bombay',
          course: 'B.Tech Data Science & AI',
          year: 3,
          bio: 'Looking for an accountability partner to grind LeetCode mediums and prep for winter data science & tech interviews.',
          avatarUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&q=80&w=400',
          subjects: ['CS229 Machine Learning', 'CS161 Algorithms', 'Applied Statistics'],
          interests: ['Hackathons', 'Specialty Chai', 'Deep Learning'],
          studyMode: 'hybrid',
          studyTime: 'night',
          studyStyle: 'pair',
        ),
        matchScore: 96,
        sharedSubjects: ['CS229 Machine Learning', 'CS161 Algorithms', 'Applied Statistics'],
        sharedInterests: ['Hackathons', 'Deep Learning'],
        compatibilityReason: 'Both study Data Science • 96% Match on Late Night & Pair Programming',
      ),
      MatchResult(
        student: Student(
          id: 3,
          userId: 3,
          fullName: 'Ananya Iyer',
          email: 'ananya.iyer@pilani.bits-pilani.ac.in',
          college: 'BITS Pilani',
          course: 'B.Tech Computer Science',
          year: 2,
          bio: 'Building fullstack AI agent projects this semester. Let\'s collaborate for Smart India Hackathon and explore PyTorch.',
          avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=400',
          subjects: ['Data Structures', 'Cloud Computing', 'Linear Algebra'],
          interests: ['SIH 2026', 'Filter Coffee', 'Open Source'],
          studyMode: 'online',
          studyTime: 'morning',
          studyStyle: 'group',
        ),
        matchScore: 91,
        sharedSubjects: ['Data Structures', 'Linear Algebra'],
        sharedInterests: ['SIH 2026', 'Open Source'],
        compatibilityReason: 'Shared interest in Smart India Hackathon & Open Source',
      ),
      MatchResult(
        student: Student(
          id: 4,
          userId: 4,
          fullName: 'Rohan Verma',
          email: 'rohan.verma@iitd.ac.in',
          college: 'IIT Delhi',
          course: 'M.Tech AI & Data Engineering',
          year: 1,
          bio: 'Prepping for Quant & Data Science placements. Looking for dedicated peer for mock coding tests and system design.',
          avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=400',
          subjects: ['Deep Learning', 'Distributed Systems', 'DBMS'],
          interests: ['Kaggle Competitions', 'Samosa & Chai', 'Fintech'],
          studyMode: 'hybrid',
          studyTime: 'night',
          studyStyle: 'pair',
        ),
        matchScore: 88,
        sharedSubjects: ['Deep Learning', 'DBMS'],
        sharedInterests: ['Kaggle Competitions'],
        compatibilityReason: 'Night session match • Shared course in Deep Learning',
      ),
      MatchResult(
        student: Student(
          id: 5,
          userId: 5,
          fullName: 'Priya Patel',
          email: 'priya.patel@iiit.ac.in',
          college: 'IIIT Hyderabad',
          course: 'B.Tech CSE & Data Analytics',
          year: 3,
          bio: 'Developing computer vision algorithms and training YOLO models. Need study buddy for Computer Networks & DSA.',
          avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=400',
          subjects: ['Computer Vision', 'Data Structures', 'Operating Systems'],
          interests: ['Robotics', 'Techfest', 'Fast Coding'],
          studyMode: 'hybrid',
          studyTime: 'evening',
          studyStyle: 'pair',
        ),
        matchScore: 85,
        sharedSubjects: ['Data Structures', 'Operating Systems'],
        sharedInterests: ['Techfest', 'Robotics'],
        compatibilityReason: 'Both attend national hackathons • Shared course in Data Structures',
      ),
      MatchResult(
        student: Student(
          id: 6,
          userId: 6,
          fullName: 'Vikram Malhotra',
          email: 'vikram.m@iitm.ac.in',
          college: 'IIT Madras',
          course: 'B.Tech Electrical & AI',
          year: 3,
          bio: 'Embedded AI, Edge ML, and robotics controller design. Ready for collaborative labs and exam cramming.',
          avatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&q=80&w=400',
          subjects: ['Edge Computing', 'Signal Processing', 'Machine Learning'],
          interests: ['Hardware Hacks', 'Drone Racing', 'Startups'],
          studyMode: 'offline',
          studyTime: 'night',
          studyStyle: 'group',
        ),
        matchScore: 82,
        sharedSubjects: ['Machine Learning'],
        sharedInterests: ['Hardware Hacks', 'Startups'],
        compatibilityReason: 'Night owl • Shared foundation in Machine Learning',
      ),
    ];
  }

  // --- Study Requests ---
  Future<StudyRequest> sendStudyRequest(int receiverId, String? message) async {
    try {
      return await app.client.studyRequest.sendStudyRequest(
        _currentStudent.id ?? 1,
        receiverId,
        message,
      );
    } catch (_) {
      return StudyRequest(
        id: 99,
        senderId: _currentStudent.id ?? 1,
        receiverId: receiverId,
        message: message ?? 'Would love to study together!',
        status: 'pending',
        createdAt: DateTime.now(),
        senderName: _currentStudent.fullName,
        senderCourse: '${_currentStudent.course}, Year ${_currentStudent.year}',
        senderAvatar: _currentStudent.avatarUrl,
      );
    }
  }

  Future<List<StudyRequest>> getIncomingRequests() async {
    try {
      final res = await app.client.studyRequest.getIncomingRequests(_currentStudent.id ?? 1);
      if (res.isNotEmpty) return res;
    } catch (_) {}

    return [
      StudyRequest(
        id: 1,
        senderId: 2,
        receiverId: _currentStudent.id ?? 1,
        message: 'Hey Rudra! Saw you are into Data Science & Machine Learning. Want to team up for the IITB AI Hackathon?',
        status: 'pending',
        createdAt: DateTime.now().subtract(const Duration(hours: 3)),
        senderName: 'Aarav Sharma',
        senderCourse: 'B.Tech Data Science & AI, 3rd Year',
        senderAvatar: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&q=80&w=400',
      ),
      StudyRequest(
        id: 2,
        senderId: 3,
        receiverId: _currentStudent.id ?? 1,
        message: 'Hi! Let\'s solve LeetCode DSA problems together this evening.',
        status: 'pending',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        senderName: 'Ananya Iyer',
        senderCourse: 'B.Tech Computer Science, 2nd Year',
        senderAvatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=400',
      ),
    ];
  }

  Future<List<StudyRequest>> getOutgoingRequests() async {
    try {
      final res = await app.client.studyRequest.getOutgoingRequests(_currentStudent.id ?? 1);
      if (res.isNotEmpty) return res;
    } catch (_) {}

    return [
      StudyRequest(
        id: 3,
        senderId: _currentStudent.id ?? 1,
        receiverId: 4,
        message: 'Hey Rohan, would love to partner up for Deep Learning and Quant interview prep!',
        status: 'pending',
        createdAt: DateTime.now().subtract(const Duration(hours: 8)),
        senderName: 'Rohan Verma',
        senderCourse: 'M.Tech AI, 1st Year (IIT Delhi)',
        senderAvatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=400',
      ),
    ];
  }

  Future<List<StudyRequest>> getAcceptedConnections() async {
    try {
      final res = await app.client.studyRequest.getAcceptedRequests(_currentStudent.id ?? 1);
      if (res.isNotEmpty) return res;
    } catch (_) {}

    return [
      StudyRequest(
        id: 4,
        senderId: 5,
        receiverId: _currentStudent.id ?? 1,
        message: 'Connected for Computer Vision and Smart India Hackathon prep.',
        status: 'accepted',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        senderName: 'Priya Patel',
        senderCourse: 'B.Tech CSE & Data Analytics (IIIT Hyderabad)',
        senderAvatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=400',
      ),
    ];
  }

  Future<List<StudyRequest>> getAcceptedRequests() => getAcceptedConnections();

  Future<bool> respondToRequest(int requestId, String newStatus) async {
    try {
      return await app.client.studyRequest.respondToRequest(requestId, newStatus);
    } catch (_) {
      return true;
    }
  }

  // --- Events (Indian Premier Hackathons & Campus Summits) ---
  final Set<int> _registeredEventIds = {2};

  Future<List<CampusEvent>> getEvents({String? category, String? search}) async {
    try {
      final res = await app.client.event.getEvents(category: category, search: search);
      if (res.isNotEmpty) return res;
    } catch (_) {}

    final list = [
      CampusEvent(
        id: 1,
        title: 'IIT Bombay AI & Agents 48h Hackathon',
        description: 'Flagship 48-hour national campus hackathon featuring Generative AI, Autonomous Agents, and Data Science tracks. ₹1,50,000 cash prize pool, industry mentors, and free meals!',
        organizer: '• IITB AI Society × Google Developer Group',
        category: 'Hackathon',
        date: DateTime.now().add(const Duration(days: 4)),
        time: 'Fri, Nov 15 • 5:00 PM IST',
        venue: 'Victor Menezes Convention Centre (VMCC) • Basement Atrium',
        bannerUrl: 'https://images.unsplash.com/photo-1515187029135-18ee286d815b?w=800',
        totalSeats: 200,
        registeredSeats: 182,
        isFree: true,
        price: 0,
      ),
      CampusEvent(
        id: 2,
        title: 'Distributed Systems Architectures & Kafka',
        description: 'Advanced engineering masterclass on event streaming, high-throughput microservices, fault tolerance, and Apache Kafka in production.',
        organizer: 'Systems Research Group • IIT Delhi',
        category: 'Workshop',
        date: DateTime.now().add(const Duration(days: 7)),
        time: 'Mon, Nov 18 • 4:00 PM IST',
        venue: 'Bharti Building Auditorium • IIT Delhi',
        bannerUrl: 'https://images.unsplash.com/photo-1522071820081-009f0129c71c?w=800',
        totalSeats: 120,
        registeredSeats: 98,
        isFree: true,
        price: 0,
      ),
      CampusEvent(
        id: 3,
        title: 'Smart India Hackathon 2026 (Grand Finale Sprint)',
        description: 'The nation\'s biggest software & hardware innovation hackathon. Solve real-world problem statements proposed by central ministries and top tech conglomerates.',
        organizer: 'Ministry of Education Innovation Cell & IIT Bombay',
        category: 'Hackathon',
        date: DateTime.now().add(const Duration(days: 12)),
        time: 'Sat, Nov 23 • 9:00 AM IST',
        venue: 'KReSIT Computer Science Lab • IIT Bombay',
        bannerUrl: 'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=800',
        totalSeats: 300,
        registeredSeats: 265,
        isFree: true,
        price: 0,
      ),
      CampusEvent(
        id: 4,
        title: 'HackOut BITS Pilani National Hackathon',
        description: '36-hour coding extravaganza with Web3, Cloud, and Agentic AI challenges. Swags, internship opportunities, and investor pitch sessions.',
        organizer: 'Coding Club BITS Pilani',
        category: 'Hackathon',
        date: DateTime.now().add(const Duration(days: 16)),
        time: 'Fri, Nov 29 • 6:00 PM IST',
        venue: 'NAB Auditorium • BITS Pilani',
        bannerUrl: 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=800',
        totalSeats: 250,
        registeredSeats: 210,
        isFree: true,
        price: 0,
      ),
      CampusEvent(
        id: 5,
        title: 'Deep Learning with PyTorch & CUDA Workshop',
        description: 'Hands-on session on fine-tuning open-weights models (Llama 3, Mistral), CUDA acceleration, and PyTorch Lightning pipelines.',
        organizer: 'Data Science Guild • IIIT Hyderabad',
        category: 'Workshop',
        date: DateTime.now().add(const Duration(days: 20)),
        time: 'Wed, Dec 4 • 2:00 PM IST',
        venue: 'R&D Building Lab 3 • IIIT Hyderabad',
        bannerUrl: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=800',
        totalSeats: 80,
        registeredSeats: 74,
        isFree: false,
        price: 199.0,
      ),
    ];

    return list.where((e) {
      if (category != null && category.isNotEmpty && category != 'All Events' && category != 'All' && e.category.toLowerCase() != category.toLowerCase()) {
        return false;
      }
      if (search != null && search.isNotEmpty) {
        final query = search.toLowerCase();
        return e.title.toLowerCase().contains(query) || e.venue.toLowerCase().contains(query) || e.organizer.toLowerCase().contains(query);
      }
      return true;
    }).toList();
  }

  bool isEventRegistered(int eventId) => _registeredEventIds.contains(eventId);

  Future<bool> toggleEventRegistration(int eventId) async {
    final isReg = _registeredEventIds.contains(eventId);
    if (isReg) {
      _registeredEventIds.remove(eventId);
      try {
        await app.client.event.unregisterFromEvent(eventId, _currentStudent.id ?? 1);
      } catch (_) {}
      return false;
    } else {
      _registeredEventIds.add(eventId);
      try {
        await app.client.event.registerForEvent(eventId, _currentStudent.id ?? 1);
      } catch (_) {}
      return true;
    }
  }

  // --- Communities (Indian Campus Clubs) ---
  final Set<int> _joinedCommunityIds = {1, 3};

  Future<List<Community>> getCommunities({String? category, String? search}) async {
    try {
      final res = await app.client.community.getCommunities(category: category, search: search);
      if (res.isNotEmpty) return res;
    } catch (_) {}

    final list = [
      Community(
        id: 1,
        name: 'Google Developer Student Club (GDSC IIT Bombay)',
        category: 'Tech',
        description: 'The epicenter of developers, hackathon teams, and mobile/web development on campus. We host code sprints, study jams, and project showcases.',
        iconUrl: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=300',
        bannerUrl: 'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=800',
        memberCount: 520,
        upcomingEventsCount: 3,
      ),
      Community(
        id: 2,
        name: 'IIT Bombay AI & Robotics Society',
        category: 'Robotics',
        description: 'Designing autonomous rovers, drones, and computer vision models. Hands-on hardware labs and competitive robotics tournaments.',
        iconUrl: 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=300',
        bannerUrl: 'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=800',
        memberCount: 340,
        upcomingEventsCount: 2,
      ),
      Community(
        id: 3,
        name: 'Competitive Coding & Algorithms Cell (IITB CP Club)',
        category: 'Coding',
        description: 'Weekly contests on Codeforces, LeetCode virtual contests, and algorithmic problem-solving sessions for placement & ICPC aspirants.',
        iconUrl: 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=300',
        bannerUrl: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=800',
        memberCount: 460,
        upcomingEventsCount: 4,
      ),
      Community(
        id: 4,
        name: 'Data Science & Analytics Guild (BITS Pilani)',
        category: 'Tech',
        description: 'Kaggle Grandmaster mentorship, PyTorch workshops, statistical modeling, and deep learning reading groups.',
        iconUrl: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=300',
        bannerUrl: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=800',
        memberCount: 290,
        upcomingEventsCount: 2,
      ),
      Community(
        id: 5,
        name: 'E-Cell & Startup Incubator (IIT Delhi)',
        category: 'Business',
        description: 'Founder meetups, angel pitch sessions, and product launch clinics for student entrepreneurs across India.',
        iconUrl: 'https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=300',
        bannerUrl: 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=800',
        memberCount: 380,
        upcomingEventsCount: 3,
      ),
    ];

    return list.where((c) {
      if (category != null && category.isNotEmpty && category != 'All' && c.category.toLowerCase() != category.toLowerCase()) {
        return false;
      }
      if (search != null && search.isNotEmpty) {
        final query = search.toLowerCase();
        return c.name.toLowerCase().contains(query) || c.description.toLowerCase().contains(query);
      }
      return true;
    }).toList();
  }

  bool isCommunityJoined(int communityId) => _joinedCommunityIds.contains(communityId);

  Future<bool> toggleCommunityMembership(int communityId) async {
    final isJoined = _joinedCommunityIds.contains(communityId);
    if (isJoined) {
      _joinedCommunityIds.remove(communityId);
      try {
        await app.client.community.leaveCommunity(communityId, _currentStudent.id ?? 1);
      } catch (_) {}
      return false;
    } else {
      _joinedCommunityIds.add(communityId);
      try {
        await app.client.community.joinCommunity(communityId, _currentStudent.id ?? 1);
      } catch (_) {}
      return true;
    }
  }

  Future<List<CommunityPost>> getCommunityPosts(int communityId) async {
    try {
      final res = await app.client.community.getCommunityPosts(communityId);
      if (res.isNotEmpty) return res;
    } catch (_) {}

    return [
      CommunityPost(
        id: 1,
        communityId: communityId,
        authorName: 'Rudra Patel',
        authorAvatar: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?auto=format&fit=crop&q=80&w=400',
        title: 'Teammate wanted for Smart India Hackathon 2026 AI Track!',
        content: 'Hey everyone, our team has 3 members proficient in Data Science & Flutter. Looking for 1 backend specialist for SIH 2026. Ping me or drop a comment!',
        createdAt: DateTime.now().subtract(const Duration(hours: 4)),
        likesCount: 22,
      ),
      CommunityPost(
        id: 2,
        communityId: communityId,
        authorName: 'Aarav Sharma (GDSC Lead)',
        authorAvatar: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&q=80&w=400',
        title: 'AI & Agents 48h Hackathon Problem Statements Released',
        content: 'Check the portal for the 5 challenge tracks: Agentic Workflows, Indic NLP, Healthcare Diagnostics, Cyber Defense, and Smart Mobility.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        likesCount: 45,
      ),
    ];
  }

  Future<CommunityPost> addCommunityPost(int communityId, String title, String content) async {
    final post = CommunityPost(
      communityId: communityId,
      authorName: _currentStudent.fullName,
      authorAvatar: _currentStudent.avatarUrl,
      title: title,
      content: content,
      createdAt: DateTime.now(),
      likesCount: 1,
    );

    try {
      return await app.client.community.addCommunityPost(post);
    } catch (_) {
      return post;
    }
  }

  // --- Quizzes ---
  Future<List<Quiz>> getQuizzes({String? subject}) async {
    try {
      final res = await app.client.quiz.getQuizzes(subject: subject);
      if (res.isNotEmpty) return res;
    } catch (_) {}

    final list = [
      Quiz(
        id: 1,
        title: 'Data Science & Machine Learning (Core)',
        subject: 'Data Science',
        description: 'Test your understanding of Gradient Descent, Overfitting, ROC-AUC, CNNs, and Transformers.',
        durationMinutes: 10,
        questionCount: 5,
        difficulty: 'Medium',
      ),
      Quiz(
        id: 2,
        title: 'Data Structures & Algorithms (Placement Sprint)',
        subject: 'Data Structures',
        description: 'Master Binary Trees, AVL balance factors, Hash collisions, and Heap operations.',
        durationMinutes: 8,
        questionCount: 4,
        difficulty: 'Hard',
      ),
      Quiz(
        id: 3,
        title: 'Fullstack Web & Cloud Architecture',
        subject: 'Web Dev',
        description: 'Core concepts in asynchronous Dart, REST APIs vs WebSockets, Serverpod ORM, and cloud scale.',
        durationMinutes: 6,
        questionCount: 4,
        difficulty: 'Easy',
      ),
      Quiz(
        id: 4,
        title: 'Database Management Systems & SQL',
        subject: 'DBMS',
        description: 'ACID properties, B-Tree indexes, 3NF normal forms, and transaction isolation levels.',
        durationMinutes: 8,
        questionCount: 4,
        difficulty: 'Medium',
      ),
    ];

    if (subject != null && subject.isNotEmpty && subject != 'All') {
      return list.where((q) => q.subject.toLowerCase() == subject.toLowerCase()).toList();
    }
    return list;
  }

  Future<List<QuizQuestion>> getQuizQuestions(int quizId) async {
    try {
      final res = await app.client.quiz.getQuizQuestions(quizId);
      if (res.isNotEmpty) return res;
    } catch (_) {}

    if (quizId == 1) {
      return [
        QuizQuestion(
          id: 1,
          quizId: 1,
          questionText: 'Which metric is best suited to evaluate classification on an imbalanced dataset?',
          options: ['Accuracy', 'ROC-AUC & F1-Score', 'Mean Squared Error', 'Adjusted R^2'],
          correctOptionIndex: 1,
          explanation: 'Accuracy is misleading for imbalanced classes; Precision, Recall, and F1-Score accurately capture minority class performance.',
        ),
        QuizQuestion(
          id: 2,
          quizId: 1,
          questionText: 'What is the primary function of the Self-Attention mechanism in Transformers?',
          options: [
            'Convolute pixel grids',
            'Compute weighted relevance between all tokens in a sequence',
            'Drop random neuron connections',
            'Normalize layer weights'
          ],
          correctOptionIndex: 1,
          explanation: 'Self-attention calculates dynamic attention weights between every pair of tokens in an input sequence.',
        ),
        QuizQuestion(
          id: 3,
          quizId: 1,
          questionText: 'Which regularisation technique prevents neural network overfitting by zeroing random activations during training?',
          options: ['L2 Ridge Regularisation', 'Batch Normalization', 'Dropout', 'Early Stopping'],
          correctOptionIndex: 2,
          explanation: 'Dropout randomly deactivates a fraction of neurons on each training step to prevent co-adaptation.',
        ),
        QuizQuestion(
          id: 4,
          quizId: 1,
          questionText: 'What is the vanishing gradient problem primarily caused by in deep networks?',
          options: [
            'Repeated multiplication of gradients < 1 via saturating activations (e.g. Sigmoid)',
            'Excessively high learning rates',
            'Using ReLU activations',
            'Large batch sizes'
          ],
          correctOptionIndex: 0,
          explanation: 'Derivatives of sigmoid are strictly ≤ 0.25; chaining them through deep layers causes backpropagated gradients to decay exponentially toward zero.',
        ),
        QuizQuestion(
          id: 5,
          quizId: 1,
          questionText: 'Which loss function is standard for multi-class classification models with softmax output?',
          options: ['Mean Absolute Error', 'Categorical Cross-Entropy', 'Huber Loss', 'Hinge Loss'],
          correctOptionIndex: 1,
          explanation: 'Categorical cross-entropy penalizes divergence between the predicted probability distribution and one-hot ground truth.',
        ),
      ];
    } else {
      return [
        QuizQuestion(
          id: 6,
          quizId: quizId,
          questionText: 'What is the average time complexity of QuickSort?',
          options: ['O(N)', 'O(N log N)', 'O(N^2)', 'O(log N)'],
          correctOptionIndex: 1,
          explanation: 'QuickSort has an expected average running time of O(N log N) with balanced partitioning.',
        ),
        QuizQuestion(
          id: 7,
          quizId: quizId,
          questionText: 'Which algorithm finds the single-source shortest path in a graph with non-negative edge weights?',
          options: ['Dijkstra’s Algorithm', 'Kruskal’s Algorithm', 'Prim’s Algorithm', 'Floyd-Warshall'],
          correctOptionIndex: 0,
          explanation: 'Dijkstra’s algorithm computes shortest paths from a source vertex with non-negative edge weights.',
        ),
        QuizQuestion(
          id: 8,
          quizId: quizId,
          questionText: 'What is the worst-case time complexity of searching in a standard Binary Search Tree (BST)?',
          options: ['O(1)', 'O(log N)', 'O(N)', 'O(N log N)'],
          correctOptionIndex: 2,
          explanation: 'In the worst case, an unbalanced BST degenerates into a linear linked list of depth N.',
        ),
      ];
    }
  }

  final List<QuizAttempt> _attempts = [
    QuizAttempt(
      id: 1,
      quizId: 1,
      studentId: 1,
      score: 100,
      totalQuestions: 5,
      correctAnswers: 5,
      wrongAnswers: 0,
      completedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  Future<QuizAttempt> submitQuizAttempt(QuizAttempt attempt) async {
    try {
      final res = await app.client.quiz.submitQuizAttempt(attempt);
      _attempts.insert(0, res);
      return res;
    } catch (_) {
      final local = attempt.copyWith(id: _attempts.length + 1);
      _attempts.insert(0, local);
      return local;
    }
  }

  Future<List<QuizAttempt>> getQuizAttempts() async {
    return _attempts;
  }

  // --- Notifications ---
  Future<List<AppNotification>> getNotifications() async {
    try {
      final res = await app.client.notification.getNotifications(_currentStudent.id ?? 1);
      if (res.isNotEmpty) return res;
    } catch (_) {}

    return [
      AppNotification(
        id: 1,
        studentId: 1,
        title: 'New Study Request ⚡',
        message: 'Aarav Sharma sent you a study request for Machine Learning & SIH 2026.',
        type: 'study_request',
        isRead: false,
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      AppNotification(
        id: 2,
        studentId: 1,
        title: 'Study Request Accepted! 🎉',
        message: 'Priya Patel accepted your study request. You can now coordinate study hours and hackathon prep!',
        type: 'request_accepted',
        isRead: false,
        createdAt: DateTime.now().subtract(const Duration(hours: 4)),
      ),
      AppNotification(
        id: 3,
        studentId: 1,
        title: 'Event Reminder: IIT Bombay AI Hackathon',
        message: 'IIT Bombay AI & Agents 48h Hackathon check-in begins Friday at 4:30 PM at VMCC Auditorium.',
        type: 'event_reminder',
        isRead: false,
        createdAt: DateTime.now().subtract(const Duration(hours: 14)),
      ),
      AppNotification(
        id: 4,
        studentId: 1,
        title: 'GDSC IIT Bombay Announcement',
        message: 'Problem statements and starter repos for Smart India Hackathon internal round are now live!',
        type: 'community_update',
        isRead: true,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  Future<void> markAllNotificationsRead() async {
    // mark all as read
  }

  // --- Bookmarks ---
  final Set<String> _bookmarkedKeys = {'event_1', 'community_1'};

  bool isBookmarked(String itemType, int itemId) {
    return _bookmarkedKeys.contains('${itemType}_$itemId');
  }

  Future<bool> toggleBookmark(String itemType, int itemId) async {
    final key = '${itemType}_$itemId';
    if (_bookmarkedKeys.contains(key)) {
      _bookmarkedKeys.remove(key);
      try {
        await app.client.bookmark.toggleBookmark(_currentStudent.id ?? 1, itemType, itemId);
      } catch (_) {}
      return false;
    } else {
      _bookmarkedKeys.add(key);
      try {
        await app.client.bookmark.toggleBookmark(_currentStudent.id ?? 1, itemType, itemId);
      } catch (_) {}
      return true;
    }
  }

  // --- Chat Messages ---
  final List<ChatMessage> _messages = [
    ChatMessage(
      id: 1,
      senderId: 5,
      receiverId: 1,
      message: 'Hey Rudra! Glad we connected on HUDDLE. When do you want to start DSA review and SIH brainstorming?',
      sentAt: DateTime.now().subtract(const Duration(hours: 5)),
      isRead: true,
    ),
    ChatMessage(
      id: 2,
      senderId: 1,
      receiverId: 5,
      message: 'Hey Priya! Tonight after 8:30 PM works great. We can discuss YOLO computer vision models and system design.',
      sentAt: DateTime.now().subtract(const Duration(hours: 4, minutes: 45)),
      isRead: true,
    ),
    ChatMessage(
      id: 3,
      senderId: 5,
      receiverId: 1,
      message: 'Awesome, see you then at Central Library or on Google Meet!',
      sentAt: DateTime.now().subtract(const Duration(hours: 4, minutes: 30)),
      isRead: true,
    ),
  ];

  Future<List<ChatMessage>> getMessages(int otherStudentId) => getMessagesWith(otherStudentId);

  Future<List<ChatMessage>> getMessagesWith(int otherStudentId) async {
    try {
      final res = await app.client.chat.getConversation(_currentStudent.id ?? 1, otherStudentId);
      if (res.isNotEmpty) return res;
    } catch (_) {}

    return _messages.where((m) {
      return (m.senderId == (_currentStudent.id ?? 1) && m.receiverId == otherStudentId) ||
          (m.senderId == otherStudentId && m.receiverId == (_currentStudent.id ?? 1));
    }).toList();
  }

  Future<ChatMessage> sendMessage(int receiverId, String text) async {
    final msg = ChatMessage(
      id: _messages.length + 1,
      senderId: _currentStudent.id ?? 1,
      receiverId: receiverId,
      message: text,
      sentAt: DateTime.now(),
      isRead: false,
    );
    _messages.add(msg);

    try {
      await app.client.chat.sendMessage(_currentStudent.id ?? 1, receiverId, text);
    } catch (_) {}

    return msg;
  }
}
