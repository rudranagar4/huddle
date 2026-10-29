import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/huddle_button.dart';
import '../../core/widgets/huddle_card.dart';

class QuizResultScreen extends StatelessWidget {
  final Quiz quiz;
  final int score;
  final int totalQuestions;
  final int correctCount;
  final int wrongCount;
  final List<QuizQuestion> questions;
  final Map<int, int> userAnswers;

  const QuizResultScreen({
    super.key,
    required this.quiz,
    required this.score,
    required this.totalQuestions,
    required this.correctCount,
    required this.wrongCount,
    required this.questions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    final passed = score >= 60;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      appBar: AppBar(
        title: Text(
          'Quiz Assessment Results',
          style: TextStyle(
            color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        backgroundColor: isDark ? AppColors.navySurfaceDark.withAlpha(200) : Colors.white.withAlpha(180),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? null : AppColors.glassBackgroundGradient,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            children: [
              // Score Banner Card
              HuddleCard(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    Container(
                      width: 104,
                      height: 104,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (passed ? AppColors.cyanBrand : AppColors.coral).withAlpha(isDark ? 30 : 20),
                        border: Border.all(
                          color: passed ? AppColors.cyanBrand : AppColors.coral,
                          width: 3.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '$score%',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: passed ? AppColors.cyanDark : AppColors.coral,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      passed ? 'Outstanding Work! 🎉' : 'Keep Practicing!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      passed
                          ? 'You demonstrated solid conceptual clarity in ${quiz.title}.'
                          : 'Review the explanations below and challenge yourself again.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isDark ? AppColors.textMuted : AppColors.textDarkBody,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Stats Breakdown Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _statBox('Correct', '$correctCount', AppColors.tealSuccess, isDark),
                        _statBox('Incorrect', '$wrongCount', AppColors.coral, isDark),
                        _statBox(
                          'Questions',
                          '$totalQuestions',
                          isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                          isDark,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Answers Breakdown & Explanations Header
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Detailed Answer Review',
                  style: TextStyle(
                    color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Review List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final q = questions[index];
                  final userPick = userAnswers[index];
                  final isCorrect = userPick == q.correctOptionIndex;

                  return HuddleCard(
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: isCorrect
                                    ? AppColors.tealSuccess.withAlpha(25)
                                    : AppColors.coral.withAlpha(25),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    isCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded,
                                    size: 14,
                                    color: isCorrect ? AppColors.tealSuccess : AppColors.coral,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    isCorrect ? 'CORRECT' : 'WRONG',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: isCorrect ? AppColors.tealSuccess : AppColors.coral,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Q${index + 1} of $totalQuestions',
                              style: TextStyle(color: isDark ? AppColors.textDim : AppColors.textDarkSubtle, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          q.questionText,
                          style: TextStyle(
                            color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Options listing with pick status
                        Column(
                          children: List.generate(q.options.length, (optIdx) {
                            final optText = q.options[optIdx];
                            final isTargetCorrect = optIdx == q.correctOptionIndex;
                            final isUserSelection = optIdx == userPick;

                            Color borderCol = isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle;
                            Color textCol = isDark ? AppColors.textMuted : AppColors.textDarkBody;
                            if (isTargetCorrect) {
                              borderCol = AppColors.tealSuccess;
                              textCol = AppColors.tealSuccess;
                            } else if (isUserSelection && !isCorrect) {
                              borderCol = AppColors.coral;
                              textCol = AppColors.coral;
                            }

                            return Container(
                              margin: const EdgeInsets.only(bottom: 6),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: isTargetCorrect
                                    ? AppColors.tealSuccess.withAlpha(15)
                                    : (isUserSelection ? AppColors.coral.withAlpha(15) : Colors.transparent),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: borderCol),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '${String.fromCharCode(65 + optIdx)}.',
                                    style: TextStyle(color: textCol, fontWeight: FontWeight.bold, fontSize: 12),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      optText,
                                      style: TextStyle(
                                        color: textCol,
                                        fontSize: 13,
                                        fontWeight: (isTargetCorrect || isUserSelection) ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  if (isTargetCorrect)
                                    const Icon(Icons.check_rounded, color: AppColors.tealSuccess, size: 16),
                                  if (isUserSelection && !isCorrect)
                                    const Icon(Icons.close_rounded, color: AppColors.coral, size: 16),
                                ],
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 10),

                        // Explanation Box
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isDark ? AppColors.navySurfaceDark : AppColors.glassCardLightSolid,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.lightbulb_outline_rounded, color: AppColors.amber, size: 16),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  q.explanation,
                                  style: TextStyle(
                                    color: isDark ? AppColors.textMuted : AppColors.textDarkBody,
                                    fontSize: 12,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Return Button
              HuddleButton(
                width: double.infinity,
                height: 52,
                text: 'Done & Return to Quizzes',
                icon: Icons.check_circle_outline_rounded,
                onPressed: () {
                  Navigator.pop(context); // Pops results
                  Navigator.pop(context); // Pops question screen back to quiz hub
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statBox(String label, String value, Color color, bool isDark) {
    return Column(
      children: [
        Text(value, style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.w900)),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(color: isDark ? AppColors.textDim : AppColors.textDarkSubtle, fontSize: 12),
        ),
      ],
    );
  }
}
