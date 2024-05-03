import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileTab extends ConsumerStatefulWidget {
  const ProfileTab({super.key, required this.t});

  final AppLocalizations t;

  static String get routeName => 'profile';
  static String get routeLocation => '/$routeName';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              //context.go(ProfileScreen.routeLocation + SettingsScreen.routeLocation);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
