import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/huddle_button.dart';
import '../../core/widgets/huddle_card.dart';

class EditProfileScreen extends StatefulWidget {
  final Student student;

  const EditProfileScreen({super.key, required this.student});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  late TextEditingController _courseController;
  late TextEditingController _collegeController;
  late int _year;
  late Set<String> _subjects;
  late Set<String> _interests;
  late String _studyMode;
  late String _studyTime;
  late String _studyStyle;
  bool _isSaving = false;

  final List<String> _allSubjects = [
    'Data Structures',
    'Algorithms',
    'Machine Learning',
    'Deep Learning & GenAI',
    'Database Systems',
    'Operating Systems',
    'Distributed Systems',
    'Computer Networks',
    'Cybersecurity',
  ];

  final List<String> _allInterests = [
    'Hackathons',
    'Open Source',
    'Competitive Programming',
    'Flutter & Mobile',
    'AI Research',
    'UI/UX Design',
    'Cloud & DevOps',
  ];

  @override
  void initState() {
    super.initState();
    final s = widget.student;
    _nameController = TextEditingController(text: s.fullName);
    _bioController = TextEditingController(text: s.bio ?? '');
    _courseController = TextEditingController(text: s.course);
    _collegeController = TextEditingController(text: s.college);
    _year = s.year;
    _subjects = Set.from(s.subjects);
    _interests = Set.from(s.interests);
    _studyMode = s.studyMode;
    _studyTime = s.studyTime;
    _studyStyle = s.studyStyle;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _courseController.dispose();
    _collegeController.dispose();
    super.dispose();
  }

  void _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);

    final updated = widget.student.copyWith(
      fullName: _nameController.text.trim(),
      bio: _bioController.text.trim(),
      course: _courseController.text.trim(),
      college: _collegeController.text.trim(),
      year: _year,
      subjects: _subjects.toList(),
      interests: _interests.toList(),
      studyMode: _studyMode,
      studyTime: _studyTime,
      studyStyle: _studyStyle,
    );

    await HuddleService.instance.updateProfile(updated);

    if (!mounted) return;
    setState(() => _isSaving = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
            SizedBox(width: 10),
            Text('Profile updated successfully!'),
          ],
        ),
        backgroundColor: AppColors.cyanDark,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      appBar: AppBar(
        title: Text(
          'Edit Student Profile',
          style: TextStyle(
            color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        backgroundColor: isDark ? AppColors.navySurfaceDark.withAlpha(200) : Colors.white.withAlpha(180),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close_rounded, size: 22, color: isDark ? AppColors.textWhite : AppColors.textDarkHeading),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? null : AppColors.glassBackgroundGradient,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section 1: Basic Info
                _sectionHeader('PERSONAL INFORMATION', isDark),
                const SizedBox(height: 10),
                HuddleCard(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _fieldLabel('Full Name', isDark),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _nameController,
                        style: TextStyle(
                          color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        decoration: _inputDeco(hint: 'e.g. Rudra Patel', isDark: isDark),
                        validator: (v) => (v == null || v.trim().isEmpty) ? 'Full name is required' : null,
                      ),
                      const SizedBox(height: 16),

                      _fieldLabel('Bio / Study Pitch', isDark),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _bioController,
                        maxLines: 3,
                        style: TextStyle(
                          color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                          fontSize: 14,
                        ),
                        decoration: _inputDeco(
                          hint: 'Describe your study goals, upcoming hackathons, or what partner you are seeking...',
                          isDark: isDark,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),

                // Section 2: Academics
                _sectionHeader('ACADEMICS & COLLEGE', isDark),
                const SizedBox(height: 10),
                HuddleCard(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _fieldLabel('College / University', isDark),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _collegeController,
                        style: TextStyle(
                          color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        decoration: _inputDeco(hint: 'e.g. IIT Bombay', isDark: isDark),
                      ),
                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _fieldLabel('Course / Major', isDark),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: _courseController,
                                  style: TextStyle(
                                    color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                  decoration: _inputDeco(hint: 'e.g. B.Tech Data Science & AI', isDark: isDark),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _fieldLabel('Year', isDark),
                                const SizedBox(height: 8),
                                DropdownButtonFormField<int>(
                                  initialValue: _year,
                                  dropdownColor: isDark ? AppColors.navyCardDark : Colors.white,
                                  style: TextStyle(
                                    color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                  decoration: _inputDeco(hint: 'Year', isDark: isDark),
                                  items: [1, 2, 3, 4, 5]
                                      .map((y) => DropdownMenuItem(value: y, child: Text('Year $y')))
                                      .toList(),
                                  onChanged: (v) => setState(() => _year = v ?? 3),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),

                // Section 3: Active Subjects
                _sectionHeader('SUBJECTS YOU ARE STUDYING', isDark),
                const SizedBox(height: 10),
                HuddleCard(
                  padding: const EdgeInsets.all(18),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    children: _allSubjects.map((sub) {
                      final isSel = _subjects.contains(sub);
                      return _filterChip(
                        label: sub,
                        isSelected: isSel,
                        isDark: isDark,
                        onTap: () {
                          setState(() {
                            if (isSel) {
                              _subjects.remove(sub);
                            } else {
                              _subjects.add(sub);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 22),

                // Section 4: Interests & Tech Stack
                _sectionHeader('INTERESTS & SKILLS', isDark),
                const SizedBox(height: 10),
                HuddleCard(
                  padding: const EdgeInsets.all(18),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    children: _allInterests.map((interest) {
                      final isSel = _interests.contains(interest);
                      return _filterChip(
                        label: interest,
                        isSelected: isSel,
                        isDark: isDark,
                        onTap: () {
                          setState(() {
                            if (isSel) {
                              _interests.remove(interest);
                            } else {
                              _interests.add(interest);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 22),

                // Section 5: Preferences
                _sectionHeader('STUDY PREFERENCES', isDark),
                const SizedBox(height: 10),
                HuddleCard(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _fieldLabel('Preferred Mode', isDark),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _prefPill('💻 Hybrid', 'hybrid', _studyMode, (v) => setState(() => _studyMode = v), isDark),
                          const SizedBox(width: 8),
                          _prefPill('🌐 Online', 'online', _studyMode, (v) => setState(() => _studyMode = v), isDark),
                          const SizedBox(width: 8),
                          _prefPill('🏫 In-Person', 'offline', _studyMode, (v) => setState(() => _studyMode = v), isDark),
                        ],
                      ),
                      const SizedBox(height: 18),

                      _fieldLabel('Study Rhythm', isDark),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _prefPill('🌙 Night Owl', 'night', _studyTime, (v) => setState(() => _studyTime = v), isDark),
                          const SizedBox(width: 8),
                          _prefPill('☀️ Early Bird', 'morning', _studyTime, (v) => setState(() => _studyTime = v), isDark),
                          const SizedBox(width: 8),
                          _prefPill('⚡ Flexible', 'flexible', _studyTime, (v) => setState(() => _studyTime = v), isDark),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Save button
                HuddleButton(
                  width: double.infinity,
                  height: 54,
                  text: 'Save Changes',
                  isLoading: _isSaving,
                  icon: Icons.check_circle_rounded,
                  onPressed: _save,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, bool isDark) {
    return Text(
      title,
      style: TextStyle(
        color: isDark ? AppColors.cyanBrand : AppColors.cyanDark,
        fontWeight: FontWeight.w800,
        fontSize: 12,
        letterSpacing: 0.8,
      ),
    );
  }

  Widget _fieldLabel(String label, bool isDark) {
    return Text(
      label,
      style: TextStyle(
        color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
        fontWeight: FontWeight.w700,
        fontSize: 13,
      ),
    );
  }

  InputDecoration _inputDeco({required String hint, required bool isDark}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: isDark ? AppColors.navySurfaceDark : Colors.white.withAlpha(230),
      hintStyle: TextStyle(
        color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
        fontSize: 13,
        fontWeight: FontWeight.normal,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.cyanBrand, width: 1.8),
      ),
    );
  }

  Widget _filterChip({
    required String label,
    required bool isSelected,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
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
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.cyanBrand.withAlpha(isDark ? 50 : 30),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected
                ? (isDark ? AppColors.cyanBrand : AppColors.cyanDark)
                : (isDark ? AppColors.textMuted : AppColors.textDarkBody),
          ),
        ),
      ),
    );
  }

  Widget _prefPill(String label, String value, String current, Function(String) onSelect, bool isDark) {
    final isSelected = value == current;
    return Expanded(
      child: InkWell(
        onTap: () => onSelect(value),
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 11),
          decoration: BoxDecoration(
            color: isSelected
                ? (isDark ? AppColors.cyanBrand.withAlpha(50) : AppColors.cyanBrand.withAlpha(35))
                : (isDark ? AppColors.navySurfaceDark : Colors.white.withAlpha(200)),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? AppColors.cyanBrand : (isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
              width: isSelected ? 1.6 : 1.0,
            ),
          ),
          child: Center(
            child: Text(
              label,
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
      ),
    );
  }
}
