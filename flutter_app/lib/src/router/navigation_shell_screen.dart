import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationShellScreen extends StatelessWidget {
  const NavigationShellScreen({
    required this.navigationShell,
    Key? key,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final current = navigationShell.currentIndex;
    return Scaffold(
      body: navigationShell,
      bottomSheet: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: current,
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(
              icon: Icon(
                Icons.home,
                color: current == 0 ? Colors.red : Colors.grey[800],
              ),
              label: ""),
          NavigationDestination(
              icon: Icon(
                Icons.person,
                color: current == 1 ? Colors.red : Colors.grey[800],
              ),
              label: "")
        ],
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == current,
          );
        },
      ),
    );
  }
}
