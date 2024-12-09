import 'package:flutter/material.dart';

import 'swipe_able_card.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SwipeableCardWidget(),
      ),
    );
  }
}
