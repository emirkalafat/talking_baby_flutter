import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talking_baby_flutter/src/navigation/main_tab/settings/theme.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key, required this.t});

  final AppLocalizations t;

  static String get routeName => 'home';
  static String get routeLocation => '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.homeTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              t.homeWelcome,
            ),
            Text(ref.read(themeNotifierProvider).toString())
          ],
        ),
      ),
    );
  }
}
