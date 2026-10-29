import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/huddle_card.dart';
import '../chat/chat_screen.dart';

class StudentProfileScreen extends StatefulWidget {
  final Student? student;
  final MatchResult? matchResult;
  final int? matchScore;
  final String? compatibilityReason;

  const StudentProfileScreen({
    super.key,
    this.student,
    this.matchResult,
    this.matchScore,
    this.compatibilityReason,
  });

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  bool _requestSent = false;

  Student get _student => widget.matchResult?.student ?? widget.student!;
  int get _score => widget.matchResult?.matchScore ?? widget.matchScore ?? 92;
  String get _compatReason => widget.matchResult?.compatibilityReason ?? widget.compatibilityReason ?? 'Shared courses & hackathon interests';

  void _showSendRequestModal() {
    final msgController = TextEditingController(
      text: 'Hey ${_student.fullName.split(' ').first}! Saw you study ${_student.subjects.isNotEmpty ? _student.subjects.first : "similar subjects"}. Let us study together for hackathons & exams!',
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        final isDark = Theme.of(ctx).brightness == Brightness.dark;
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
          ),
          child: Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: isDark ? AppColors.navyCardDark : Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(_student.avatarUrl ?? ''),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Study Request to ${_student.fullName}',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          _student.college,
                          style: const TextStyle(fontSize: 12, color: AppColors.cyanDark, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Message Note', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextField(
                  controller: msgController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Share what you are prepping for or your study schedule...',
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(ctx);
                      await HuddleService.instance.sendStudyRequest(_student.id ?? 1, msgController.text.trim());
                      setState(() => _requestSent = true);
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.mintSuccess,
                            content: Text('Study request sent to ${_student.fullName}!'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.cyanBrand,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('Send Study Request', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = _student;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      appBar: AppBar(
        title: Text(s.fullName),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(buddy: s),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            // Student Hero Glass Card
            HuddleCard(
              padding: const EdgeInsets.all(22),
              borderRadius: 24,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.cyanBrand, width: 2.5),
                        ),
                        child: CircleAvatar(
                          radius: 44,
                          backgroundImage: NetworkImage(s.avatarUrl ?? ''),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: AppColors.mintSuccess,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.5),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        s.fullName,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.verified_rounded, size: 20, color: Color(0xFF0284C7)),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    '${s.course} • Year ${s.year}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.cyanDark,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.school_rounded, size: 14, color: Color(0xFF64748B)),
                      const SizedBox(width: 5),
                      Text(
                        s.college,
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500,
                          color: isDark ? AppColors.textMuted : AppColors.textDarkMuted,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // Compatibility Score Ring
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F9FF),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFFBAE6FD)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: AppColors.cyanBrand,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '$_score%',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 11),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            _compatReason,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.cyanDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Bio Card
            HuddleCard(
              padding: const EdgeInsets.all(18),
              borderRadius: 22,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About & Goals',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '"${s.bio}"',
                    style: TextStyle(
                      fontSize: 13.5,
                      color: isDark ? AppColors.textWhite : const Color(0xFF334155),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Study Style & Preferences
            HuddleCard(
              padding: const EdgeInsets.all(18),
              borderRadius: 22,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Study Styles & Preferences',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildPill('Mode: ${s.studyMode.toUpperCase()}', const Color(0xFFE0F2FE), const Color(0xFF0284C7)),
                      _buildPill('Timing: LATE NIGHT', const Color(0xFFFEF3C7), const Color(0xFFB45309)),
                      _buildPill('Style: PAIR PROGRAMMING', const Color(0xFFFFEDD5), const Color(0xFFC2410C)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Enrolled Subjects',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: s.subjects.map((sub) {
                      return _buildPill(sub, const Color(0xFFF1F5F9), const Color(0xFF334155));
                    }).toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Action Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: Container(
                decoration: BoxDecoration(
                  gradient: _requestSent ? null : AppColors.cyanActionGradient,
                  color: _requestSent ? AppColors.mintLight : null,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: _requestSent
                      ? null
                      : [
                          BoxShadow(
                            color: AppColors.cyanBrand.withAlpha(90),
                            blurRadius: 14,
                            offset: const Offset(0, 4),
                          ),
                        ],
                ),
                child: ElevatedButton(
                  onPressed: _requestSent ? null : _showSendRequestModal,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _requestSent ? Icons.check_circle_rounded : Icons.person_add_alt_1_rounded,
                        color: _requestSent ? AppColors.mintText : Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _requestSent ? 'Study Request Sent ✓' : 'Send Study Request',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: _requestSent ? AppColors.mintText : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPill(String text, Color bg, Color textCol) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: textCol),
      ),
    );
  }
}
