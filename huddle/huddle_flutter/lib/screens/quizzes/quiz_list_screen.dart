import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/huddle_button.dart';
import '../../core/widgets/huddle_card.dart';
import '../../core/widgets/state_views.dart';
import 'quiz_taking_screen.dart';

class QuizListScreen extends StatefulWidget {
  const QuizListScreen({super.key});

  @override
  State<QuizListScreen> createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  List<Quiz> _quizzes = [];
  List<QuizAttempt> _attempts = [];
  bool _isLoading = true;
  String _selectedSubject = 'All';

  final List<String> _subjects = [
    'All',
    'Data Structures',
    'Algorithms',
    'Machine Learning',
    'Database Systems',
    'Operating Systems',
    'Computer Networks',
  ];

  @override
  void initState() {
    super.initState();
    _loadQuizzes();
  }

  void _loadQuizzes() async {
    setState(() => _isLoading = true);
    final subject = _selectedSubject == 'All' ? null : _selectedSubject;
    final list = await HuddleService.instance.getQuizzes(subject: subject);
    final attempts = await HuddleService.instance.getQuizAttempts();

    if (!mounted) return;
    setState(() {
      _quizzes = list;
      _attempts = attempts;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    int bestScore = 0;
    if (_attempts.isNotEmpty) {
      bestScore = _attempts.map((a) => a.score).reduce((a, b) => a > b ? a : b);
    }
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      appBar: AppBar(
        title: Text(
          'Subject Quizzes & Challenges',
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
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? null : AppColors.glassBackgroundGradient,
        ),
        child: Column(
          children: [
            // Best Score / Stats Banner
            if (_attempts.isNotEmpty)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  gradient: isDark
                      ? const LinearGradient(colors: [Color(0xFF10283A), Color(0xFF10172A)])
                      : const LinearGradient(colors: [Color(0xFFE2F7F9), Colors.white]),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.cyanBrand.withAlpha(80)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.cyanBrand.withAlpha(isDark ? 25 : 15),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.amber.withAlpha(25),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.emoji_events_rounded, color: AppColors.amber, size: 24),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Best Score',
                            style: TextStyle(color: isDark ? AppColors.textDim : AppColors.textDarkSubtle, fontSize: 11),
                          ),
                          Text(
                            '$bestScore% High Score',
                            style: TextStyle(
                              color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${_attempts.length} completed',
                      style: const TextStyle(color: AppColors.cyanDark, fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),

            // Subject Chips Row
            Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _subjects.length,
                separatorBuilder: (context, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final sub = _subjects[index];
                  final isSelected = sub == _selectedSubject;
                  return InkWell(
                    onTap: () {
                      setState(() => _selectedSubject = sub);
                      _loadQuizzes();
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? (isDark ? AppColors.cyanBrand.withAlpha(50) : AppColors.cyanBrand.withAlpha(35))
                            : (isDark ? AppColors.navySurfaceDark : Colors.white.withAlpha(200)),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? AppColors.cyanBrand : (isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                          width: isSelected ? 1.6 : 1.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          sub,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            color: isSelected
                                ? (isDark ? AppColors.cyanBrand : AppColors.cyanDark)
                                : (isDark ? AppColors.textMuted : AppColors.textDarkBody),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),

            // Quizzes List
            Expanded(
              child: _isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          LoadingSkeleton(height: 140),
                          SizedBox(height: 14),
                          LoadingSkeleton(height: 140),
                        ],
                      ),
                    )
                  : _quizzes.isEmpty
                      ? const EmptyStateView(
                          icon: Icons.quiz_outlined,
                          title: 'No Quizzes Found',
                          message: 'No quizzes for this subject yet. Try selecting "All".',
                        )
                      : RefreshIndicator(
                          onRefresh: () async => _loadQuizzes(),
                          color: AppColors.cyanBrand,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                            itemCount: _quizzes.length,
                            itemBuilder: (context, index) {
                              final q = _quizzes[index];

                              Color diffColor = AppColors.tealSuccess;
                              if (q.difficulty == 'Medium') {
                                diffColor = AppColors.amber;
                              } else if (q.difficulty == 'Hard') {
                                diffColor = AppColors.coral;
                              }

                              return HuddleCard(
                                margin: const EdgeInsets.only(bottom: 14),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: AppColors.cyanBrand.withAlpha(isDark ? 40 : 25),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            q.subject.toUpperCase(),
                                            style: const TextStyle(
                                              color: AppColors.cyanDark,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: diffColor.withAlpha(25),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: diffColor.withAlpha(80)),
                                          ),
                                          child: Text(
                                            q.difficulty.toUpperCase(),
                                            style: TextStyle(
                                              color: diffColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      q.title,
                                      style: TextStyle(
                                        color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      q.description,
                                      style: TextStyle(
                                        color: isDark ? AppColors.textMuted : AppColors.textDarkBody,
                                        fontSize: 13,
                                        height: 1.4,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.timer_outlined, size: 14, color: isDark ? AppColors.textDim : AppColors.textDarkSubtle),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${q.durationMinutes} mins',
                                              style: TextStyle(color: isDark ? AppColors.textDim : AppColors.textDarkSubtle, fontSize: 12),
                                            ),
                                            const SizedBox(width: 14),
                                            Icon(Icons.help_outline_rounded, size: 14, color: isDark ? AppColors.textDim : AppColors.textDarkSubtle),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${q.questionCount} questions',
                                              style: TextStyle(color: isDark ? AppColors.textDim : AppColors.textDarkSubtle, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        HuddleButton(
                                          height: 38,
                                          text: 'Start Quiz',
                                          icon: Icons.play_arrow_rounded,
                                          onPressed: () async {
                                            await Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) => QuizTakingScreen(quiz: q),
                                              ),
                                            );
                                            _loadQuizzes();
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
