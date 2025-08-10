// the one and only GoRouter instance
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarot/scaffold_with_nested_navigation.dart';
import 'package:tarot/screens/cards_list_screen.dart';
import 'package:tarot/screens/custom_profile_screen.dart';
import 'package:tarot/screens/custom_sign_in_screen.dart';
import 'package:tarot/screens/deya_asana_list_screen.dart';
import 'package:tarot/screens/home_screen.dart';
import 'package:tarot/screens/library_screen.dart';
import 'package:tarot/screens/rider_waite_list_screen.dart';
import 'package:tarot/screens/shop_screen.dart';
import 'package:tarot/screens/single_taro_card_screen.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/sign-in',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      name: 'sign-in',
      path: '/sign-in',
      builder: (context, state) => const CustomSignInScreen(),
    ),

    // Stateful nested navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        // Расклады
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // top route inside branch
            GoRoute(
              name: '/',
              path: '/',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HomeScreen()),
              routes: [
                // child route
                GoRoute(
                  path: 'cards',
                  builder: (context, state) => const CardsListScreen(),
                ),
              ],
            ),
          ],
        ),

        // Обучение
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/b',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: LibraryScreen()),
              routes: [
                // child route
                GoRoute(
                  path: 'cards',
                  builder: (context, state) => const CardsListScreen(),
                ),
              ],
            ),
          ],
        ),

        // Библиотека
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/library',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: LibraryScreen()),
              routes: [
                // child route
                GoRoute(
                  path: 'deya-asanas',
                  builder: (context, state) => const DeyaAsanaListScreen(),
                ),
                GoRoute(
                  path: 'rider-waite',
                  builder: (context, state) => const RiderWaiteListScreen(),
                  routes: [
                    GoRoute(
                      path: ':id',
                      builder: (context, state) {
                        final cardName = state.pathParameters['id']!;
                        return SingleTarotCardScreen(cardName: cardName);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        // fourth branch (D)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: CustomProfileScreen()),
              routes: [
                // child route
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const ShopScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
