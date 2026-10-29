import 'package:flutter/material.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/huddle_button.dart';
import '../../core/widgets/huddle_card.dart';
import '../navigation_shell.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'rudra.patel@iitb.ac.in');
  final _passwordController = TextEditingController(text: 'password123');
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    await HuddleService.instance.login(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
    if (!mounted) return;
    setState(() => _isLoading = false);

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const NavigationShell()),
      (route) => false,
    );
  }

  void _showForgotPasswordDialog(bool isDark) {
    final resetEmailController = TextEditingController(text: _emailController.text);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? AppColors.navyCardDark : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderLight),
        ),
        title: Text(
          'Reset Password',
          style: TextStyle(
            color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
            fontWeight: FontWeight.w800,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your campus email address to receive password reset instructions.',
              style: TextStyle(color: isDark ? AppColors.textMuted : AppColors.textDarkBody, fontSize: 13),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: resetEmailController,
              style: TextStyle(color: isDark ? AppColors.textWhite : AppColors.textDarkHeading),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined, color: AppColors.cyanDark, size: 20),
                hintText: 'rudra.patel@iitb.ac.in',
                filled: true,
                fillColor: isDark ? AppColors.navySurfaceDark : AppColors.glassCardLightSolid,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Cancel', style: TextStyle(color: isDark ? AppColors.textDim : AppColors.textDarkSubtle)),
          ),
          HuddleButton(
            text: 'Send Link',
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Password reset link sent to your campus email!'),
                  backgroundColor: AppColors.cyanDark,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      appBar: AppBar(
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
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App Emblem
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: AppColors.cyanActionGradient,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.cyanBrand.withAlpha(80),
                          blurRadius: 14,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'H',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to your HUDDLE account to reconnect with study partners and campus hackathons.',
                    style: TextStyle(
                      color: isDark ? AppColors.textMuted : AppColors.textDarkBody,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Email field
                  Text(
                    'Campus Email',
                    style: TextStyle(
                      color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: 'e.g. rudra.patel@iitb.ac.in',
                      prefixIcon: const Icon(Icons.email_outlined, color: AppColors.cyanDark, size: 20),
                      filled: true,
                      fillColor: isDark ? AppColors.navySurfaceDark : Colors.white.withAlpha(230),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: AppColors.cyanBrand, width: 1.8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) return 'Please enter your email';
                      if (!value.contains('@') || !value.contains('.')) return 'Please enter a valid email address';
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Password field
                  Text(
                    'Password',
                    style: TextStyle(
                      color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: TextStyle(
                      color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.lock_outline_rounded, color: AppColors.cyanDark, size: 20),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
                          size: 20,
                        ),
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      ),
                      filled: true,
                      fillColor: isDark ? AppColors.navySurfaceDark : Colors.white.withAlpha(230),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: AppColors.cyanBrand, width: 1.8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.length < 6) return 'Password must be at least 6 characters';
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Forgot Password link
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => _showForgotPasswordDialog(isDark),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: AppColors.cyanDark, fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Log In Button
                  HuddleButton(
                    width: double.infinity,
                    height: 52,
                    text: 'Sign In',
                    isLoading: _isLoading,
                    icon: Icons.login_rounded,
                    onPressed: _handleLogin,
                  ),
                  const SizedBox(height: 22),

                  // Demo Autofill Box
                  HuddleCard(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, color: AppColors.cyanDark, size: 18),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Demo: Rudra Patel (IIT Bombay Data Science)',
                            style: TextStyle(color: isDark ? AppColors.textMuted : AppColors.textDarkBody, fontSize: 12),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _emailController.text = 'rudra.patel@iitb.ac.in';
                              _passwordController.text = 'password123';
                            });
                          },
                          child: const Text(
                            'Autofill',
                            style: TextStyle(color: AppColors.cyanDark, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Register CTA
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(color: isDark ? AppColors.textMuted : AppColors.textDarkMuted),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const RegisterScreen()),
                            );
                          },
                          child: const Text(
                            'Register Now',
                            style: TextStyle(color: AppColors.cyanDark, fontWeight: FontWeight.w800),
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
      ),
    );
  }
}
