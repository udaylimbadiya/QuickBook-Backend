import 'package:flutter/material.dart';

class ThemeProvider
    extends ChangeNotifier {

  /// DARK MODE STATE
  bool _isDarkMode = false;

  /// GET CURRENT MODE
  bool get isDarkMode =>
      _isDarkMode;

  /// THEME MODE
  ThemeMode get themeMode =>

      _isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light;

  /// TOGGLE THEME
  void toggleTheme() {

    _isDarkMode =
        !_isDarkMode;

    notifyListeners();

  }

  /// LIGHT THEME
  ThemeData get lightTheme =>

      ThemeData(

        useMaterial3: true,

        brightness:
            Brightness.light,

        scaffoldBackgroundColor:
            const Color(
          0xffF4F7FC,
        ),

        primaryColor:
            const Color(
          0xff5DADE2,
        ),

        colorScheme:
            ColorScheme.light(

          primary:
              const Color(
            0xff5DADE2,
          ),

          secondary:
              const Color(
            0xff34495E,
          ),

          surface:
              Colors.white,

        ),

        appBarTheme:
            const AppBarTheme(

          backgroundColor:
              Color(
            0xffF4F7FC,
          ),

          elevation: 0,

          centerTitle: true,

          foregroundColor:
              Colors.black,

        ),

        cardColor:
            Colors.white,

        dividerColor:
            Colors.grey,

        iconTheme:
            const IconThemeData(

          color:
              Colors.black87,

        ),

        textTheme:
            const TextTheme(

          bodyLarge:
              TextStyle(

            color:
                Colors.black87,

          ),

          bodyMedium:
              TextStyle(

            color:
                Colors.black54,

          ),

        ),

        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(

          backgroundColor:
              Colors.white,

          selectedItemColor:
              Color(
            0xff5DADE2,
          ),

          unselectedItemColor:
              Colors.grey,

          elevation: 0,

          type:
              BottomNavigationBarType.fixed,

        ),

        switchTheme:
            SwitchThemeData(

          thumbColor:
              WidgetStateProperty.all(

            const Color(
              0xff5DADE2,
            ),

          ),

        ),

      );

  /// DARK THEME
  ThemeData get darkTheme =>

      ThemeData(

        useMaterial3: true,

        brightness:
            Brightness.dark,

        scaffoldBackgroundColor:
            const Color(
          0xff121212,
        ),

        primaryColor:
            const Color(
          0xff5DADE2,
        ),

        colorScheme:
            const ColorScheme.dark(

          primary:
              Color(
            0xff5DADE2,
          ),

          secondary:
              Color(
            0xff34495E,
          ),

          surface:
              Color(
            0xff1E1E1E,
          ),

        ),

        appBarTheme:
            const AppBarTheme(

          backgroundColor:
              Color(
            0xff121212,
          ),

          elevation: 0,

          centerTitle: true,

        ),

        cardColor:
            const Color(
          0xff1E1E1E,
        ),

        dividerColor:
            Colors.white24,

        iconTheme:
            const IconThemeData(

          color:
              Colors.white,

        ),

        textTheme:
            const TextTheme(

          bodyLarge:
              TextStyle(

            color:
                Colors.white,

          ),

          bodyMedium:
              TextStyle(

            color:
                Colors.white70,

          ),

        ),

        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(

          backgroundColor:
              Color(
            0xff1E1E1E,
          ),

          selectedItemColor:
              Color(
            0xff5DADE2,
          ),

          unselectedItemColor:
              Colors.grey,

          elevation: 0,

          type:
              BottomNavigationBarType.fixed,

        ),

        switchTheme:
            SwitchThemeData(

          thumbColor:
              WidgetStateProperty.all(

            const Color(
              0xff5DADE2,
            ),

          ),

        ),

      );

}