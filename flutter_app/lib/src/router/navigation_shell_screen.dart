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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: navigationShell),
            Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    navigationShell.goBranch(
                      0,
                      initialLocation: 0 == current,
                    );
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        size: current == 0 ? 30 : 22,
                        color: current == 0 ? Colors.red : Colors.grey[800],
                      ),
                      Text("Home",
                          style: TextStyle(
                            fontSize: 12,
                            color: current == 0 ? Colors.red : Colors.grey[800],
                          ))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navigationShell.goBranch(
                      1,
                      initialLocation: 1 == current,
                    );
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: current == 1 ? 30 : 22,
                        color: current == 1 ? Colors.red : Colors.grey[800],
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 12,
                            color:
                                current == 1 ? Colors.red : Colors.grey[800]),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
