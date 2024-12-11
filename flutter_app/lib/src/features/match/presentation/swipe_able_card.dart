import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'heart_throb.dart';
import 'profile_card.dart';
import 'profile_notifier.dart';

class SwipeableCardWidget extends ConsumerStatefulWidget {
  const SwipeableCardWidget({super.key});

  @override
  SwipeableCardWidgetState createState() => SwipeableCardWidgetState();
}

class SwipeableCardWidgetState extends ConsumerState<SwipeableCardWidget>
    with TickerProviderStateMixin {
  late AnimationController _swipeAnimationController;
  // late AnimationController _tumbleAnimationController;

  late Animation<Offset> _swipeAnimation;
  // late Animation<double> _tumbleAnimation;
  double _dragDistance = 0.0;

  @override
  void initState() {
    super.initState();
    _swipeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // _tumbleAnimationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 300),
    // );
  }

  @override
  void dispose() {
    _swipeAnimationController.dispose();
    // _tumbleAnimationController.dispose();
    super.dispose();
  }

  void _animateCardOffscreen(double offsetX) {
    _swipeAnimation = Tween<Offset>(
      begin: Offset(_dragDistance, 0),
      end: Offset(offsetX, 0),
    ).animate(CurvedAnimation(
      parent: _swipeAnimationController,
      curve: Curves.easeOut,
    ));

    _swipeAnimationController.forward().then((_) {
      setState(() {
        _dragDistance = 0;
      });
      _swipeAnimationController.reset();
      ref.read(profileProvider.notifier).fetchMoreProfiles();
    });
  }

  void _onSwipeRight() {
    // _tumbleAnimation = Tween<double>(
    //   begin: 0,
    //   end: pi * 0.1,
    // ).animate(CurvedAnimation(
    //   parent: _tumbleAnimationController,
    //   curve: Curves.easeInOut,
    // ));
    // _tumbleAnimationController.forward();
    _animateCardOffscreen(300);
  }

  void _onSwipeLeft() {
    // _tumbleAnimation = Tween<double>(
    //   begin: 0,
    //   end: pi * -0.1,
    // ).animate(CurvedAnimation(
    //   parent: _tumbleAnimationController,
    //   curve: Curves.easeInOut,
    // ));
    _animateCardOffscreen(-300);
  }

  void _resetCardPosition() {
    setState(() {
      _dragDistance = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final (profile, nextProfile) = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Swifey",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: profile == null
                    ? HeartThrob()
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          nextProfile == null
                              ? HeartThrob()
                              : ProfileCard(profile: nextProfile),
                          GestureDetector(
                            onPanUpdate: (details) {
                              setState(() {
                                _dragDistance += details.delta.dx;
                              });
                            },
                            onPanEnd: (details) {
                              if (_dragDistance > 100) {
                                _onSwipeRight();
                              } else if (_dragDistance < -100) {
                                _onSwipeLeft();
                              } else {
                                _resetCardPosition();
                              }
                            },
                            child: AnimatedBuilder(
                              animation: _swipeAnimationController,
                              builder: (context, child) {
                                return Transform.rotate(
                                  alignment: Alignment.bottomCenter,
                                  angle: _dragDistance * 0.001,
                                  child: Transform.translate(
                                    offset:
                                        _swipeAnimationController.isAnimating
                                            ? _swipeAnimation.value
                                            : Offset(_dragDistance, 0),
                                    child: child,
                                  ),
                                );
                              },
                              child: ProfileCard(profile: profile),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
