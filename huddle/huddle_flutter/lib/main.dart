import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import 'core/services/huddle_service.dart';
import 'core/theme/app_theme.dart';
import 'screens/splash_screen.dart';

late final Client client;
late String serverUrl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Serverpod Client
  final url = await getServerUrl();
  serverUrl = url;

  client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor()
    ..authSessionManager = FlutterAuthSessionManager();

  try {
    client.auth.initialize();
  } catch (_) {}

  runApp(const HuddleApp());
}

class HuddleApp extends StatelessWidget {
  const HuddleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: HuddleService.instance.themeModeNotifier,
      builder: (context, currentMode, _) {
        return MaterialApp(
          title: 'HUDDLE',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: currentMode,
          home: const SplashScreen(),
        );
      },
    );
  }
}
