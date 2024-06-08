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
      height: cardWidth / 2,
      child: Card(
        color: colorScheme.primaryContainer,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ToyStateCard(
                colorScheme: colorScheme,
                isConnected: false,
              ),
              const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/100.png'),
                  radius: 48),
              ToyStateCard(
                colorScheme: colorScheme,
                batteryLevel: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ToyStateCard extends StatelessWidget {
  const ToyStateCard({
    super.key,
    required this.colorScheme,
    this.isConnected,
    this.batteryLevel,
  }) : assert(isConnected != null || batteryLevel != null);

  final ColorScheme colorScheme;
  final bool? isConnected;
  final int? batteryLevel;

  showBatteryIcon(int? level) {
    if (level == null) {
      return Icons.battery_unknown;
    }
    switch (((level / 100) * 7).floor()) {
      case 0:
        return Icons.battery_0_bar;
      case 1:
        return Icons.battery_1_bar;
      case 2:
        return Icons.battery_2_bar;
      case 3:
        return Icons.battery_3_bar;
      case 4:
        return Icons.battery_4_bar;
      case 5:
        return Icons.battery_5_bar;
      case 6:
        return Icons.battery_6_bar;
      case 7:
        return Icons.battery_full;
      default:
        return Icons.battery_alert;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isConnected != null
              ? isConnected!
                  ? const Icon(Icons.link_off)
                  : const Icon(Icons.link)
              : batteryLevel != null
                  ? Icon(showBatteryIcon(batteryLevel!))
                  : Text(0.toString()),
          isConnected != null
              ? isConnected!
                  ? const Text('Bağlı Değil')
                  : const Text('Bağlı')
              : batteryLevel != null
                  ? Text(batteryLevel.toString())
                  : Text(0.toString()),
        ],
      ),
    );
  }
}
