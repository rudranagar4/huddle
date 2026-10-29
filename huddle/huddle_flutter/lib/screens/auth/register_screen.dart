import 'package:flutter/material.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/huddle_button.dart';
import '../../core/widgets/huddle_card.dart';
import '../navigation_shell.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController(text: 'Rudra Patel');
  final _emailController = TextEditingController(text: 'rudra.patel@iitb.ac.in');
  final _passwordController = TextEditingController(text: 'password123');
  final _collegeController = TextEditingController(text: 'IIT Bombay');
  final _courseController = TextEditingController(text: 'B.Tech Data Science & AI');
  int _selectedYear = 3;

  final List<String> _availableSubjects = [
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
  final Set<String> _selectedSubjects = {'Data Structures', 'Algorithms', 'Machine Learning'};

  final List<String> _availableInterests = [
    'Hackathons',
    'Open Source',
    'Competitive Programming',
    'Flutter & Mobile',
    'AI Research',
    'UI/UX Design',
    'Cloud & DevOps',
  ];
  final Set<String> _selectedInterests = {'Hackathons', 'Flutter & Mobile', 'AI Research'};

  String _studyMode = 'hybrid'; // online, offline, hybrid
  String _studyTime = 'night'; // morning, night, flexible
  final String _studyStyle = 'pair'; // pair, group, solo

  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _collegeController.dispose();
    _courseController.dispose();
    super.dispose();
  }

  void _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedSubjects.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least 1 study subject')),
      );
      return;
    }

    setState(() => _isLoading = true);
    await HuddleService.instance.register(
      fullName: _nameController.text.trim(),
      email: _emailController.text.trim(),
      college: _collegeController.text.trim(),
      course: _courseController.text.trim(),
      year: _selectedYear,
      subjects: _selectedSubjects.toList(),
      interests: _selectedInterests.toList(),
      studyMode: _studyMode,
      studyTime: _studyTime,
      studyStyle: _studyStyle,
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const NavigationShell()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      appBar: AppBar(
        title: Text(
          'Create Student Account',
          style: TextStyle(
            color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.transparent,
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
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Join HUDDLE',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Set up your student profile to find study buddies and explore premier Indian hackathons.',
                    style: TextStyle(color: isDark ? AppColors.textMuted : AppColors.textDarkBody, fontSize: 13),
                  ),
                  const SizedBox(height: 24),

                  // Basic Profile Card
                  _sectionHeader('STUDENT CREDENTIALS', isDark),
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
                          style: TextStyle(color: isDark ? AppColors.textWhite : AppColors.textDarkHeading, fontWeight: FontWeight.w600),
                          decoration: _inputDeco(hint: 'e.g. Rudra Patel', isDark: isDark, icon: Icons.person_outline_rounded),
                          validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter your name' : null,
                        ),
                        const SizedBox(height: 16),

                        _fieldLabel('Campus Email', isDark),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: isDark ? AppColors.textWhite : AppColors.textDarkHeading, fontWeight: FontWeight.w600),
                          decoration: _inputDeco(hint: 'rudra.patel@iitb.ac.in', isDark: isDark, icon: Icons.email_outlined),
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) return 'Please enter your email';
                            if (!v.contains('@')) return 'Enter a valid email';
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        _fieldLabel('Password', isDark),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          style: TextStyle(color: isDark ? AppColors.textWhite : AppColors.textDarkHeading, fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            hintText: 'Create a password (min 6 chars)',
                            prefixIcon: const Icon(Icons.lock_outline_rounded, color: AppColors.cyanDark, size: 20),
                            suffixIcon: IconButton(
                              icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, size: 20),
                              onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                            ),
                            filled: true,
                            fillColor: isDark ? AppColors.navySurfaceDark : Colors.white.withAlpha(230),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                            ),
                          ),
                          validator: (v) => (v == null || v.length < 6) ? 'Password must be at least 6 characters' : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),

                  // Academics Card
                  _sectionHeader('COLLEGE & MAJOR', isDark),
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
                          style: TextStyle(color: isDark ? AppColors.textWhite : AppColors.textDarkHeading, fontWeight: FontWeight.w600),
                          decoration: _inputDeco(hint: 'e.g. IIT Bombay', isDark: isDark, icon: Icons.school_outlined),
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
                                    style: TextStyle(color: isDark ? AppColors.textWhite : AppColors.textDarkHeading, fontWeight: FontWeight.w600),
                                    decoration: _inputDeco(hint: 'B.Tech Data Science & AI', isDark: isDark),
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
                                    initialValue: _selectedYear,
                                    dropdownColor: isDark ? AppColors.navyCardDark : Colors.white,
                                    style: TextStyle(color: isDark ? AppColors.textWhite : AppColors.textDarkHeading, fontWeight: FontWeight.w600),
                                    decoration: _inputDeco(hint: 'Year', isDark: isDark),
                                    items: [1, 2, 3, 4, 5]
                                        .map((y) => DropdownMenuItem(value: y, child: Text('Year $y')))
                                        .toList(),
                                    onChanged: (v) => setState(() => _selectedYear = v ?? 3),
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

                  // Subjects to Study (Chips)
                  _sectionHeader('SUBJECTS YOU ARE STUDYING', isDark),
                  const SizedBox(height: 10),
                  HuddleCard(
                    padding: const EdgeInsets.all(18),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 10,
                      children: _availableSubjects.map((sub) {
                        final isSel = _selectedSubjects.contains(sub);
                        return _filterChip(
                          label: sub,
                          isSelected: isSel,
                          isDark: isDark,
                          onTap: () {
                            setState(() {
                              if (isSel) {
                                _selectedSubjects.remove(sub);
                              } else {
                                _selectedSubjects.add(sub);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 22),

                  // Interests / Domains (Chips)
                  _sectionHeader('INTERESTS & HOBBIES', isDark),
                  const SizedBox(height: 10),
                  HuddleCard(
                    padding: const EdgeInsets.all(18),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 10,
                      children: _availableInterests.map((interest) {
                        final isSel = _selectedInterests.contains(interest);
                        return _filterChip(
                          label: interest,
                          isSelected: isSel,
                          isDark: isDark,
                          onTap: () {
                            setState(() {
                              if (isSel) {
                                _selectedInterests.remove(interest);
                              } else {
                                _selectedInterests.add(interest);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 22),

                  // Study Preferences
                  _sectionHeader('STUDY PREFERENCES', isDark),
                  const SizedBox(height: 10),
                  HuddleCard(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _fieldLabel('Preferred Mode', isDark),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _buildOptionButton('💻 Hybrid', 'hybrid', _studyMode, (val) => setState(() => _studyMode = val), isDark),
                            const SizedBox(width: 8),
                            _buildOptionButton('🌐 Online', 'online', _studyMode, (val) => setState(() => _studyMode = val), isDark),
                            const SizedBox(width: 8),
                            _buildOptionButton('🏫 In-Person', 'offline', _studyMode, (val) => setState(() => _studyMode = val), isDark),
                          ],
                        ),
                        const SizedBox(height: 16),

                        _fieldLabel('Study Rhythm', isDark),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _buildOptionButton('🌙 Night Owl', 'night', _studyTime, (val) => setState(() => _studyTime = val), isDark),
                            const SizedBox(width: 8),
                            _buildOptionButton('☀️ Early Bird', 'morning', _studyTime, (val) => setState(() => _studyTime = val), isDark),
                            const SizedBox(width: 8),
                            _buildOptionButton('⚡ Flexible', 'flexible', _studyTime, (val) => setState(() => _studyTime = val), isDark),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Submit Button
                  HuddleButton(
                    width: double.infinity,
                    height: 54,
                    text: 'Complete Registration',
                    isLoading: _isLoading,
                    icon: Icons.check_circle_outline_rounded,
                    onPressed: _handleRegister,
                  ),
                  const SizedBox(height: 36),
                ],
              ),
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

  InputDecoration _inputDeco({required String hint, required bool isDark, IconData? icon}) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: icon != null ? Icon(icon, color: AppColors.cyanDark, size: 20) : null,
      filled: true,
      fillColor: isDark ? AppColors.navySurfaceDark : Colors.white.withAlpha(230),
      hintStyle: TextStyle(
        color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
        fontSize: 13,
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

  Widget _buildOptionButton(String label, String value, String currentValue, Function(String) onSelect, bool isDark) {
    final isSelected = value == currentValue;
    return Expanded(
      child: InkWell(
        onTap: () => onSelect(value),
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? (isDark ? AppColors.cyanBrand.withAlpha(50) : AppColors.cyanBrand.withAlpha(35))
                : (isDark ? AppColors.navySurfaceDark : Colors.white.withAlpha(200)),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppColors.cyanBrand : (isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
              width: isSelected ? 1.5 : 1.0,
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
