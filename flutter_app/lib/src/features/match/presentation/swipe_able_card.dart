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
  late AnimationController _scaleAnimationController;

  late Animation<Offset> _swipeAnimation;

  double _dragDistance = 0.0;

  @override
  void initState() {
    super.initState();
    _swipeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimationController.forward();
  }

  @override
  void dispose() {
    _swipeAnimationController.dispose();
    _scaleAnimationController.dispose();
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
      _scaleAnimationController.forward(from: 0.9);

      // Fetch more profiles if at the end of the list

      ref.read(profileProvider.notifier).fetchMoreProfiles();
    });
  }

  void _onSwipeRight() {
    _animateCardOffscreen(300);
  }

  void _onSwipeLeft() {
    _animateCardOffscreen(-300);
  }

  void _resetCardPosition() {
    setState(() {
      _dragDistance = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: profile == null
              ? HeartThrob()
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 5),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    clipBehavior: Clip.hardEdge,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
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
                              return Transform.translate(
                                offset: _swipeAnimationController.isAnimating
                                    ? _swipeAnimation.value
                                    : Offset(_dragDistance, 0),
                                child: child,
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
      ),
    );
  }
}
