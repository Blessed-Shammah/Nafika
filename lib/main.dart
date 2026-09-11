import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/auth_screen.dart';
import 'providers/auth_provider.dart';
// import 'firebase_options.dart'; // Uncomment after running flutterfire configure

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase (Uncomment below once flutterfire CLI is run)
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(
    const ProviderScope(
      child: NafikaApp(),
    ),
  );
}

class NafikaApp extends ConsumerWidget {
  const NafikaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authProvider);

    return MaterialApp(
      title: 'Nafika',
      theme: AppTheme.darkTheme,
      home: isAuthenticated ? const HomeScreen() : const AuthScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
