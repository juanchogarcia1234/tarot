// Stateful nested navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({Key? key, required this.navigationShell})
    : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

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
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            icon: Image.asset('assets/icons/house.png', width: 53, height: 53),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Image.asset(
              'assets/icons/meditation.png',
              width: 45,
              height: 43,
            ),
            label: 'Магазин',
          ),
          NavigationDestination(
            icon: Image.asset('assets/icons/book.png', width: 58, height: 58),
            label: 'Библиотека',
          ),
          NavigationDestination(
            icon: Image.asset(
              'assets/icons/profile.png',
              width: 45,
              height: 45,
            ),
            label: 'Профиль',
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
