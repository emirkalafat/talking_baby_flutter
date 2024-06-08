import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talking_baby_flutter/src/navigation/main_tab/home/scan_devices/bluetooth_off_screen.dart';
import 'package:talking_baby_flutter/src/widgets/home_screen_add_card.dart';
import 'package:talking_baby_flutter/src/widgets/home_screen_card.dart';

class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({super.key, required this.t});

  final AppLocalizations t;

  static String get routeName => 'home';
  static String get routeLocation => '/$routeName';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {

  BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;

  late StreamSubscription<BluetoothAdapterState> _adapterStateStateSubscription;

  @override
  void initState() {
    super.initState();
    _adapterStateStateSubscription =
        FlutterBluePlus.adapterState.listen((state) {
      _adapterState = state;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _adapterStateStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardWidth = ((MediaQuery.of(context).size.width)) - 16;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.t.homeTitle),
      ),
      body: SingleChildScrollView(
        primary: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _adapterState == BluetoothAdapterState.on ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return HomeScreenCard(
                      cardWidth: cardWidth,
                      colorScheme: colorScheme,
                      t: widget.t);
                },
              ): const Text('Bluetooth is off'),
              HomeScreenAddCard(
                  cardWidth: cardWidth, colorScheme: colorScheme, t: widget.t),
            ],
          ),
        ),
      ),
    );
  }
}
