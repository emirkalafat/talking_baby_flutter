import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:talking_baby_flutter/src/navigation/main_tab/home/home_screen.dart';
import 'package:talking_baby_flutter/src/navigation/main_tab/profile/profile_screen.dart';
import 'package:talking_baby_flutter/src/navigation/main_tab/settings/settings_controller.dart';
import 'package:talking_baby_flutter/src/navigation/main_tab/settings/settings_service.dart';
import 'package:talking_baby_flutter/src/navigation/main_tab/settings/settings_view.dart';

final _key = GlobalKey<NavigatorState>();

final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellProfile');
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

final routerProvider = Provider<GoRouter>((ref) {
  //final authState = ref.watch(authStageChangeProvider);

  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: SplashPage.routeLocation,
    routes: [
      // Stateful nested navigation based on:
      // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          final t = AppLocalizations.of(context)!;
          // the UI shell
          return ScaffoldWithNestedNavigation(
              navigationShell: navigationShell, t: t);
        },
        branches: [
          //Home Tab
          StatefulShellBranch(navigatorKey: _shellNavigatorHomeKey, routes: [
            GoRoute(
              path: HomeTab.routeLocation,
              name: HomeTab.routeName,
              builder: (context, state) {
                final t = AppLocalizations.of(context)!;
                return HomeTab(t: t);
              },
            ),
          ]),
          //Profile Tab
          StatefulShellBranch(navigatorKey: _shellNavigatorProfileKey, routes: [
            GoRoute(
              path: ProfileTab.routeLocation,
              name: ProfileTab.routeName,
              builder: (context, state) {
                final t = AppLocalizations.of(context)!;
                return ProfileTab(t: t);
              },
            ),
          ]),
          //Settings Tab
          StatefulShellBranch(
              navigatorKey: _shellNavigatorSettingsKey,
              routes: [
                GoRoute(
                  path: SettingsTab.routeLocation,
                  name: SettingsTab.routeName,
                  builder: (context, state) {
                    final t = AppLocalizations.of(context)!;
                    final controller = SettingsController(SettingsService());
                    return SettingsTab(t: t, controller: controller);
                  },
                ),
              ]),
        ],
      ),
      //SplashPage
      GoRoute(
        path: SplashPage.routeLocation,
        name: SplashPage.routeName,
        builder: (context, state) {
          return const SplashPage();
        },
      ),
    ],
    redirect: (context, state) {
      //// If our async state is loading, don't perform redirects, yet
      //if (authState.isLoading || authState.hasError) return null;
      ////if (!familyState) return null;
//
      ////check if user is in family if not, redirect to family create if so, redirect to home
//
      //// Here we guarantee that hasData == true, i.e. we have a readable value
//
      //// This has to do with how the FirebaseAuth SDK handles the "log-in" state
      //// Returning `null` means "we are not authorized"
      //final isAuth = authState.valueOrNull != null;
//
      //final isSplash = state.fullPath == SplashPage.routeLocation;
      //if (isSplash) {
      //  return isAuth ? HomeScreen.routeLocation : LoginScreen.routeLocation;
      //}
//
      //final isLoggingIn = state.fullPath == LoginScreen.routeLocation;
      //if (isLoggingIn) return isAuth ? HomeScreen.routeLocation : null;
//
      //return isAuth ? null : SplashPage.routeLocation;
      return HomeTab.routeLocation;
    },
  );
});

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static String get routeName => 'splash';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Splash Page")),
    );
  }
}

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
    required this.t,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;
  final AppLocalizations t;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        height: 64,
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
              label: t.navigationHome, icon: const Icon(Icons.home)),
          NavigationDestination(
              label: t.navigationHome, icon: const Icon(Icons.settings)),
          NavigationDestination(
              label: t.navigationHome, icon: const Icon(Icons.person)),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
