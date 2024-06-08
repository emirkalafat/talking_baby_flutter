import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:talking_baby_flutter/src/navigation/main_tab/home/scan_devices/scan_devices_screen.dart';

class HomeScreenAddCard extends StatelessWidget {
  const HomeScreenAddCard({
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
    return GestureDetector(
      onTap: () {
        context.go(ScanDevicesScreen.routeLocation);
      },
      child: SizedBox(
        width: cardWidth / 2,
        height: cardWidth / 4,
        child: Card(
          color: colorScheme.tertiaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add, size: 48, color: colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
