import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeMode {
  light,
  dark,
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeData?>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<ThemeData?> {
  ThemeMode _mode;
  ThemeNotifier({
    ThemeMode mode = ThemeMode.light,
  })  : _mode = mode,
        super(darkThemeMode) {
    getTheme();
  }

  ThemeMode get theme {
    return _mode;
  }

  Future<ThemeMode> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');

    if (theme == 'light') {
      _mode = ThemeMode.light;
      state = lightThemeMode;
    }
    else {
      _mode = ThemeMode.dark;
      state = darkThemeMode;
    }
    return _mode;
  }

  Brightness getSystemThemeMode() {
    final platformBrightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    print('theme ' + platformBrightness.toString());
    return platformBrightness;
  }

  void setTheme(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (themeMode == ThemeMode.dark) {
      _mode = ThemeMode.dark;
      state = darkThemeMode;
      await prefs.setString('theme', 'dark');
    }
    else {
      _mode = ThemeMode.light;
      state = lightThemeMode;
      await prefs.setString('theme', 'light');
    }
  }
}

final darkThemeMode = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: buildTextTheme(),
  colorScheme: darkColorScheme,
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
);

final lightThemeMode = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: buildTextTheme(),
  colorScheme: lightColorScheme,
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(), //TODO: configure this
  ),
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF006781),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFBAEAFF),
  onPrimaryContainer: Color(0xFF001F29),
  secondary: Color(0xFF4C616B),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFCFE6F1),
  onSecondaryContainer: Color(0xFF071E26),
  tertiary: Color(0xFF5B5B7E),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFE2DFFF),
  onTertiaryContainer: Color(0xFF181837),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFBFCFE),
  onBackground: Color(0xFF191C1E),
  surface: Color(0xFFFBFCFE),
  onSurface: Color(0xFF191C1E),
  surfaceVariant: Color(0xFFDCE4E8),
  onSurfaceVariant: Color(0xFF40484C),
  outline: Color(0xFF70787D),
  onInverseSurface: Color(0xFFEFF1F3),
  inverseSurface: Color(0xFF2E3132),
  inversePrimary: Color(0xFF60D4FE),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006781),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF60D4FE),
  onPrimary: Color(0xFF003545),
  primaryContainer: Color(0xFF004D62),
  onPrimaryContainer: Color(0xFFBAEAFF),
  secondary: Color(0xFFB3CAD5),
  onSecondary: Color(0xFF1E333C),
  secondaryContainer: Color(0xFF354A53),
  onSecondaryContainer: Color(0xFFCFE6F1),
  tertiary: Color(0xFFC4C3EB),
  onTertiary: Color(0xFF2D2D4D),
  tertiaryContainer: Color(0xFF444465),
  onTertiaryContainer: Color(0xFFE2DFFF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1E),
  onBackground: Color(0xFFE1E3E4),
  surface: Color(0xFF191C1E),
  onSurface: Color(0xFFE1E3E4),
  surfaceVariant: Color(0xFF40484C),
  onSurfaceVariant: Color(0xFFC0C8CC),
  outline: Color(0xFF8A9296),
  onInverseSurface: Color(0xFF191C1E),
  inverseSurface: Color(0xFFE1E3E4),
  inversePrimary: Color(0xFF006781),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF60D4FE),
);

TextTheme buildTextTheme() {
  return TextTheme(
    displayLarge: GoogleFonts.rubik(
        fontSize: 83, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    displayMedium: GoogleFonts.rubik(
        fontSize: 52, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    displaySmall: GoogleFonts.rubik(fontSize: 42, fontWeight: FontWeight.w400),
    headlineMedium: GoogleFonts.rubik(
        fontSize: 29, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headlineSmall: GoogleFonts.rubik(fontSize: 21, fontWeight: FontWeight.w400),
    titleLarge: GoogleFonts.rubik(
        fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleMedium: GoogleFonts.rubik(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    titleSmall: GoogleFonts.rubik(
        fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyLarge: GoogleFonts.inter(
        fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyMedium: GoogleFonts.inter(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    labelLarge: GoogleFonts.inter(
        fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    bodySmall: GoogleFonts.inter(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    labelSmall: GoogleFonts.inter(
        fontSize: 8, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );
}
