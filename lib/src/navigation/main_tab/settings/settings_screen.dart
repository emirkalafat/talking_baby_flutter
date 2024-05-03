import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talking_baby_flutter/src/navigation/main_tab/settings/theme.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key, required this.t});

  final AppLocalizations t;

  static String get routeName => 'settings';
  static String get routeLocation => '/$routeName';

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  ThemeMode? get theme => ref.watch(themeNotifierProvider);
  AppLocalizations get t => widget.t;

  @override
  Widget build(BuildContext context) {
    // Read the SettingsController from the provider

    return Scaffold(
      appBar: AppBar(
        title: Text(t.settingsTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(t.settings_theme_title,style: Theme.of(context).textTheme.titleLarge,),
            DropdownButton<ThemeMode>(
              // Read the selected themeMode from the controller
              value: theme,
              // Call the updateThemeMode method any time the user selects a theme.
              onChanged: (mode) => {
                setState(() {
                  ref.read(themeNotifierProvider.notifier).setTheme(mode);
                })
              },
              items: [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text(t.settings_theme_system),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text(t.settings_theme_light),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text(t.settings_theme_dark),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
