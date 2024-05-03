
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreenCard extends StatelessWidget {
  const HomeScreenCard({
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