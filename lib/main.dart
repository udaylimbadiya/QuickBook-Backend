import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

/// PROVIDER
import 'providers/theme_provider.dart';

/// NAVIGATION
import 'screens/navigation/bottom_nav_screen.dart';

Future<void> main() async {

  /// REQUIRED FOR WIDGETS
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(

      providers: [

        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),

      ],

      child: const QuickBookApp(),
    ),
  );
}

class QuickBookApp extends StatelessWidget {

  const QuickBookApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final themeProvider =
        Provider.of<ThemeProvider>(
      context,
    );

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'QuickBook',

      /// LIGHT THEME
      theme: themeProvider.lightTheme,

      /// DARK THEME
      darkTheme: themeProvider.darkTheme,

      /// CURRENT THEME MODE
      themeMode: themeProvider.themeMode,

      /// APP START SCREEN
      home: const BottomNavScreen(),

      /// SMOOTH PAGE TRANSITION
      themeAnimationDuration: const Duration(
        milliseconds: 300,
      ),
    );
  }
}