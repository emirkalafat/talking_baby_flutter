import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talking_baby_flutter/src/widgets/home_screen_card.dart';

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
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
              spacing: 8,
              runSpacing: 8,
              children: [
                HomeScreenCard(
                    cardWidth: cardWidth, colorScheme: colorScheme, t: t),
                HomeScreenCard(
                    cardWidth: cardWidth, colorScheme: colorScheme, t: t),
                HomeScreenCard(
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

