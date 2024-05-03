import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talking_baby_flutter/riverpod_lesson/providers.dart';
import 'package:talking_baby_flutter/src/navigation/main_tab/settings/theme.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key, required this.t});

  final AppLocalizations t;

  static String get routeName => 'home';
  static String get routeLocation => '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardWidth = ((MediaQuery.of(context).size.width) / 2) - 16;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.homeTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(ref.watch(counterProvider).toString()),
            ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).increment();
                },
                child: const Text('Increment')),
            ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).increment();
                },
                child: const Text('Increment')),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
              spacing: 8,
              runSpacing: 8,
              children: [
                MainMenuCard(
                    cardWidth: cardWidth, colorScheme: colorScheme, t: t),
                MainMenuCard(
                    cardWidth: cardWidth, colorScheme: colorScheme, t: t),
                MainMenuCard(
                    cardWidth: cardWidth, colorScheme: colorScheme, t: t),
                Text(
                  t.homeWelcome,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MainMenuCard extends StatelessWidget {
  const MainMenuCard({
    super.key,
    required this.cardWidth,
    required this.colorScheme,
    required this.t,
  });

  final double cardWidth;
  final ColorScheme colorScheme;
  final AppLocalizations t;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      height: cardWidth,
      child: Card(
        color: colorScheme.primaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(t.homeWelcome),
        ),
      ),
    );
  }
}
