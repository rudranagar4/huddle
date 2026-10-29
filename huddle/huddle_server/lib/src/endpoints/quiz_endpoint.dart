import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class QuizEndpoint extends Endpoint {
  static final List<Quiz> _quizzes = [
    Quiz(
      id: 1,
      title: 'Data Structures & Trees Challenge',
      subject: 'Data Structures',
      description: 'Test your understanding of Binary Search Trees, AVL balance factors, Hash collisions, and heaps.',
      durationMinutes: 10,
      questionCount: 5,
      difficulty: 'Medium',
    ),
    Quiz(
      id: 2,
      title: 'Algorithms & Time Complexity',
      subject: 'Algorithms',
      description: 'Master Big-O notation, Divide & Conquer algorithms, Dynamic Programming, and Graph Traversals.',
      durationMinutes: 8,
      questionCount: 4,
      difficulty: 'Hard',
    ),
    Quiz(
      id: 3,
      title: 'Modern Fullstack & Dart Essentials',
      subject: 'Web Dev',
      description: 'Core concepts in asynchronous Dart, REST vs WebSockets, Serverpod ORM, and responsive layouts.',
      durationMinutes: 6,
      questionCount: 4,
      difficulty: 'Easy',
    ),
    Quiz(
      id: 4,
      title: 'Database Systems & SQL Optimization',
      subject: 'DBMS',
      description: 'ACID properties, B-Tree indexes, normal forms, and transaction isolation levels.',
      durationMinutes: 8,
      questionCount: 4,
      difficulty: 'Medium',
    ),
  ];

  static final List<QuizQuestion> _questions = [
    // Quiz 1: Data Structures
    QuizQuestion(
      id: 1,
      quizId: 1,
      questionText: 'What is the worst-case time complexity of searching in a standard Binary Search Tree (BST)?',
      options: ['O(1)', 'O(log N)', 'O(N)', 'O(N log N)'],
      correctOptionIndex: 2,
      explanation: 'In the worst case, a BST can degenerate into a linked list (skewed tree), causing searches to take O(N) time.',
    ),
    QuizQuestion(
      id: 2,
      quizId: 1,
      questionText: 'Which data structure is fundamentally used for implementing Breadth-First Search (BFS)?',
      options: ['Stack', 'Queue', 'Priority Queue', 'Array List'],
      correctOptionIndex: 1,
      explanation: 'BFS explores neighbor nodes level by level using a First-In-First-Out (FIFO) Queue.',
    ),
    QuizQuestion(
      id: 3,
      quizId: 1,
      questionText: 'What is the balance factor condition for every node in an AVL tree?',
      options: ['-1, 0, or +1', 'Strictly 0', '-2 to +2', 'Any integer value'],
      correctOptionIndex: 0,
      explanation: 'In an AVL tree, the difference in height between left and right subtrees must be between -1 and +1.',
    ),
    QuizQuestion(
      id: 4,
      quizId: 1,
      questionText: 'Which collision resolution method in hash tables stores collided elements in linked lists?',
      options: ['Linear Probing', 'Quadratic Probing', 'Double Hashing', 'Separate Chaining'],
      correctOptionIndex: 3,
      explanation: 'Separate chaining uses an auxiliary data structure such as a linked list or tree at each bucket.',
    ),
    QuizQuestion(
      id: 5,
      quizId: 1,
      questionText: 'In a Min-Heap, where is the smallest element located?',
      options: ['Leftmost leaf', 'Rightmost leaf', 'Root node', 'Any arbitrary node'],
      correctOptionIndex: 2,
      explanation: 'The min-heap property ensures that each parent is smaller than or equal to its children, placing the minimum at the root.',
    ),

    // Quiz 2: Algorithms
    QuizQuestion(
      id: 6,
      quizId: 2,
      questionText: 'What is the average time complexity of QuickSort?',
      options: ['O(N)', 'O(N log N)', 'O(N^2)', 'O(log N)'],
      correctOptionIndex: 1,
      explanation: 'QuickSort has an expected average running time of O(N log N) with balanced partitioning.',
    ),
    QuizQuestion(
      id: 7,
      quizId: 2,
      questionText: 'Which algorithm finds the single-source shortest path in a graph with non-negative edge weights?',
      options: ['Dijkstra’s Algorithm', 'Kruskal’s Algorithm', 'Prim’s Algorithm', 'Floyd-Warshall'],
      correctOptionIndex: 0,
      explanation: 'Dijkstra’s algorithm computes shortest paths from a source vertex with non-negative edge weights using a priority queue.',
    ),
    QuizQuestion(
      id: 8,
      quizId: 2,
      questionText: 'Dynamic programming is best suited for problems that have which two key characteristics?',
      options: [
        'Greedy choice & Linear space',
        'Overlapping subproblems & Optimal substructure',
        'Divide & Conquer with disjoint sets',
        'Constant time branches'
      ],
      correctOptionIndex: 1,
      explanation: 'Dynamic programming solves overlapping subproblems by memoizing their optimal substructures.',
    ),
    QuizQuestion(
      id: 9,
      quizId: 2,
      questionText: 'What is the time complexity of binary search on a sorted array of size N?',
      options: ['O(1)', 'O(log N)', 'O(N)', 'O(N log N)'],
      correctOptionIndex: 1,
      explanation: 'Binary search halves the search space in each step, yielding logarithmic time O(log N).',
    ),

    // Quiz 3: Web Dev & Dart
    QuizQuestion(
      id: 10,
      quizId: 3,
      questionText: 'In Dart, what keyword is used to pause execution until a Future completes?',
      options: ['wait', 'yield', 'await', 'defer'],
      correctOptionIndex: 2,
      explanation: 'The `await` keyword pauses execution in an `async` function until the Future yields a value.',
    ),
    QuizQuestion(
      id: 11,
      quizId: 3,
      questionText: 'What protocol does Serverpod use to enable full-duplex real-time client-server communication?',
      options: ['HTTP Long Polling', 'WebSockets', 'FTP', 'gRPC exclusively'],
      correctOptionIndex: 1,
      explanation: 'Serverpod provides built-in real-time streaming communication over WebSockets.',
    ),
    QuizQuestion(
      id: 12,
      quizId: 3,
      questionText: 'Which Flutter widget is used to lay out its children vertically?',
      options: ['Row', 'Column', 'Stack', 'Wrap'],
      correctOptionIndex: 1,
      explanation: 'Column arranges children in a vertical array along its main axis.',
    ),
    QuizQuestion(
      id: 13,
      quizId: 3,
      questionText: 'What is the primary benefit of Serverpod code generation?',
      options: [
        'Compiles Flutter into assembly',
        'Auto-generates type-safe client APIs, models, and database serializations',
        'Runs CSS inside Dart',
        'Removes need for PostgreSQL'
      ],
      correctOptionIndex: 1,
      explanation: 'Serverpod code generator automatically creates strongly-typed models, serializers, and RPC client stubs.',
    ),

    // Quiz 4: DBMS
    QuizQuestion(
      id: 14,
      quizId: 4,
      questionText: 'What does the "I" stand for in ACID properties of database transactions?',
      options: ['Integrity', 'Isolation', 'Indexation', 'Idempotence'],
      correctOptionIndex: 1,
      explanation: 'Isolation ensures concurrent execution of transactions leaves the database in the same state as serial execution.',
    ),
    QuizQuestion(
      id: 15,
      quizId: 4,
      questionText: 'Which index type is default in PostgreSQL for general column lookups and range queries?',
      options: ['Hash', 'B-Tree', 'GiST', 'GIN'],
      correctOptionIndex: 1,
      explanation: 'B-Tree indexes are standard in relational databases because they efficiently handle equality and range queries.',
    ),
    QuizQuestion(
      id: 16,
      quizId: 4,
      questionText: 'In database normalization, which normal form eliminates transitive dependencies?',
      options: ['1NF', '2NF', '3NF', 'BCNF'],
      correctOptionIndex: 2,
      explanation: '3NF requires that every non-key attribute is non-transitively dependent on primary key.',
    ),
    QuizQuestion(
      id: 17,
      quizId: 4,
      questionText: 'Which SQL clause is used to filter records after aggregation with GROUP BY?',
      options: ['WHERE', 'HAVING', 'FILTER', 'LIMIT'],
      correctOptionIndex: 1,
      explanation: 'HAVING is applied after aggregation, whereas WHERE filters individual rows before grouping.',
    ),
  ];

  static final List<QuizAttempt> _attempts = [
    QuizAttempt(
      id: 1,
      quizId: 1,
      studentId: 1,
      score: 80,
      totalQuestions: 5,
      correctAnswers: 4,
      wrongAnswers: 1,
      completedAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  Future<List<Quiz>> getQuizzes(Session session, {String? subject}) async {
    try {
      final dbQuizzes = await Quiz.db.find(session);
      if (dbQuizzes.isNotEmpty) {
        return _filterQuizzes(dbQuizzes, subject);
      }
    } catch (_) {}
    return _filterQuizzes(_quizzes, subject);
  }

  List<Quiz> _filterQuizzes(List<Quiz> list, String? subject) {
    if (subject == null || subject.isEmpty || subject == 'All') return list;
    return list.where((q) => q.subject.toLowerCase() == subject.toLowerCase()).toList();
  }

  Future<List<QuizQuestion>> getQuizQuestions(Session session, int quizId) async {
    return _questions.where((q) => q.quizId == quizId).toList();
  }

  Future<QuizAttempt> submitQuizAttempt(Session session, QuizAttempt attempt) async {
    final newAttempt = attempt.copyWith(
      id: _attempts.length + 1,
      completedAt: DateTime.now(),
    );
    try {
      await QuizAttempt.db.insertRow(session, newAttempt);
    } catch (_) {}
    _attempts.add(newAttempt);
    return newAttempt;
  }

  Future<List<QuizAttempt>> getMyQuizAttempts(Session session, int studentId) async {
    return _attempts.where((a) => a.studentId == studentId).toList();
  }
}
