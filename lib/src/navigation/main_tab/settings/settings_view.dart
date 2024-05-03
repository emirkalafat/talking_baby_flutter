import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talking_baby_flutter/src/navigation/main_tab/settings/theme.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsTab extends ConsumerStatefulWidget {
  const SettingsTab({super.key, required this.t});

  final AppLocalizations t;

  static String get routeName => 'settings';
  static String get routeLocation => '/$routeName';

  @override
  ConsumerState<SettingsTab> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsTab> {
  ThemeMode get theme => ref.read(themeNotifierProvider.notifier).state!;

  @override
  Widget build(BuildContext context) {
    // Read the SettingsController from the provider

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: DropdownButton<ThemeMode>(
          // Read the selected themeMode from the controller
          value: theme,
          // Call the updateThemeMode method any time the user selects a theme.
          onChanged: (mode) => {
            setState(() {
              ref.read(themeNotifierProvider.notifier).setTheme(mode);
            })
          },
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Dark Theme'),
            )
          ],
        ),
      ),
    );
  }
}
