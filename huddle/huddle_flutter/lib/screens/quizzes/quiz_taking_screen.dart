import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/huddle_button.dart';
import '../../core/widgets/huddle_card.dart';
import '../../core/widgets/state_views.dart';
import 'quiz_result_screen.dart';

class QuizTakingScreen extends StatefulWidget {
  final Quiz quiz;

  const QuizTakingScreen({super.key, required this.quiz});

  @override
  State<QuizTakingScreen> createState() => _QuizTakingScreenState();
}

class _QuizTakingScreenState extends State<QuizTakingScreen> {
  List<QuizQuestion> _questions = [];
  bool _isLoading = true;
  int _currentIndex = 0;
  final Map<int, int> _userAnswers = {}; // questionIndex -> selectedOptionIndex

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _loadQuestions() async {
    final qs = await HuddleService.instance.getQuizQuestions(widget.quiz.id ?? 1);
    if (!mounted) return;
    setState(() {
      _questions = qs;
      _isLoading = false;
    });
  }

  void _selectOption(int optionIndex) {
    setState(() {
      _userAnswers[_currentIndex] = optionIndex;
    });
  }

  void _submitQuiz() async {
    int correct = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_userAnswers[i] == _questions[i].correctOptionIndex) {
        correct++;
      }
    }
    final wrong = _questions.length - correct;
    final score = ((correct / _questions.length) * 100).round();

    final attempt = QuizAttempt(
      quizId: widget.quiz.id ?? 1,
      studentId: HuddleService.instance.currentStudent.id ?? 1,
      score: score,
      totalQuestions: _questions.length,
      correctAnswers: correct,
      wrongAnswers: wrong,
      completedAt: DateTime.now(),
    );

    await HuddleService.instance.submitQuizAttempt(attempt);

    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => QuizResultScreen(
          quiz: widget.quiz,
          score: score,
          totalQuestions: _questions.length,
          correctCount: correct,
          wrongCount: wrong,
          questions: _questions,
          userAnswers: _userAnswers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (_isLoading) {
      return Scaffold(
        backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
        body: const Center(child: CircularProgressIndicator(color: AppColors.cyanBrand)),
      );
    }

    if (_questions.isEmpty) {
      return Scaffold(
        backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
        appBar: AppBar(title: Text(widget.quiz.title)),
        body: EmptyStateView(
          icon: Icons.quiz_outlined,
          title: 'No Questions Found',
          message: 'This quiz is currently being updated with new questions. Check back soon!',
          actionText: 'Go Back',
          onAction: () => Navigator.pop(context),
        ),
      );
    }

    final currentQuestion = _questions[_currentIndex];
    final selectedOption = _userAnswers[_currentIndex];
    final isLastQuestion = _currentIndex == _questions.length - 1;
    final progress = (_currentIndex + 1) / _questions.length;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      appBar: AppBar(
        title: Text(
          widget.quiz.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
          ),
        ),
        backgroundColor: isDark ? AppColors.navySurfaceDark.withAlpha(200) : Colors.white.withAlpha(180),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close_rounded, size: 22, color: isDark ? AppColors.textWhite : AppColors.textDarkHeading),
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                backgroundColor: isDark ? AppColors.navyCardDark : Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                title: Text('Quit Quiz?', style: TextStyle(color: isDark ? AppColors.textWhite : AppColors.textDarkHeading, fontWeight: FontWeight.bold)),
                content: Text(
                  'Are you sure you want to exit? Your answers will not be recorded.',
                  style: TextStyle(color: isDark ? AppColors.textMuted : AppColors.textDarkBody),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: Text('Resume', style: TextStyle(color: isDark ? AppColors.cyanBrand : AppColors.cyanDark)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                      Navigator.pop(context);
                    },
                    child: const Text('Exit', style: TextStyle(color: AppColors.coral)),
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.cyanBrand.withAlpha(isDark ? 40 : 25),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.cyanBrand.withAlpha(90)),
            ),
            child: Row(
              children: [
                const Icon(Icons.timer_outlined, size: 14, color: AppColors.cyanDark),
                const SizedBox(width: 4),
                Text(
                  '${widget.quiz.durationMinutes} min',
                  style: const TextStyle(color: AppColors.cyanDark, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? null : AppColors.glassBackgroundGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress Bar & Question Counter
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Question ${_currentIndex + 1} of ${_questions.length}',
                      style: const TextStyle(color: AppColors.cyanDark, fontWeight: FontWeight.w800, fontSize: 13),
                    ),
                    Text(
                      '${(progress * 100).toInt()}% completed',
                      style: TextStyle(color: isDark ? AppColors.textDim : AppColors.textDarkSubtle, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.cyanBrand),
                  ),
                ),
                const SizedBox(height: 24),

                // Question Card
                HuddleCard(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    currentQuestion.questionText,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                      height: 1.45,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Multiple Choice Options List
                Expanded(
                  child: ListView.separated(
                    itemCount: currentQuestion.options.length,
                    separatorBuilder: (context, _) => const SizedBox(height: 12),
                    itemBuilder: (context, optIndex) {
                      final optionText = currentQuestion.options[optIndex];
                      final isSelected = selectedOption == optIndex;

                      return InkWell(
                        onTap: () => _selectOption(optIndex),
                        borderRadius: BorderRadius.circular(16),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? (isDark ? AppColors.cyanBrand.withAlpha(50) : AppColors.cyanBrand.withAlpha(35))
                                : (isDark ? AppColors.navyCardDark : Colors.white),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected ? AppColors.cyanBrand : (isDark ? AppColors.navyBorderDark : AppColors.glassBorderLight),
                              width: isSelected ? 2.0 : 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: (isSelected ? AppColors.cyanBrand : Colors.black).withAlpha(isDark ? 25 : 10),
                                blurRadius: isSelected ? 10 : 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? AppColors.cyanDark
                                      : (isDark ? AppColors.navySurfaceDark : AppColors.glassCardLightSolid),
                                  border: Border.all(
                                    color: isSelected ? AppColors.cyanDark : (isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    String.fromCharCode(65 + optIndex),
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : (isDark ? AppColors.textMuted : AppColors.textDarkBody),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Text(
                                  optionText,
                                  style: TextStyle(
                                    color: isSelected
                                        ? (isDark ? AppColors.textWhite : AppColors.textDarkHeading)
                                        : (isDark ? AppColors.textMuted : AppColors.textDarkBody),
                                    fontSize: 14,
                                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                  ),
                                ),
                              ),
                              if (isSelected)
                                const Icon(Icons.check_circle_rounded, color: AppColors.cyanDark, size: 20),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Bottom Navigation (Previous / Next / Submit)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      if (_currentIndex > 0) ...[
                        HuddleButton(
                          height: 50,
                          text: 'Prev',
                          variant: HuddleButtonVariant.outline,
                          icon: Icons.chevron_left_rounded,
                          onPressed: () => setState(() => _currentIndex--),
                        ),
                        const SizedBox(width: 12),
                      ],
                      Expanded(
                        child: HuddleButton(
                          height: 50,
                          text: isLastQuestion ? 'Submit Assessment' : 'Next Question',
                          icon: isLastQuestion ? Icons.check_circle_rounded : Icons.chevron_right_rounded,
                          onPressed: selectedOption == null
                              ? null
                              : () {
                                  if (isLastQuestion) {
                                    _submitQuiz();
                                  } else {
                                    setState(() => _currentIndex++);
                                  }
                                },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
