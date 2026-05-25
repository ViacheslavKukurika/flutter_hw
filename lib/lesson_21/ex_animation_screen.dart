import 'dart:math' as math;
import 'package:flutter/material.dart';

class ExAnimationScreen extends StatefulWidget {
  const ExAnimationScreen({super.key});

  @override
  State<ExAnimationScreen> createState() => _ExAnimationScreenState();
}

class _ExAnimationScreenState extends State<ExAnimationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotationAnimation;
  late final Animation<Alignment> _alignmentAnimation;

  static const String _ballPath = 'assets/icons/lesson_21/ball.png';

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  void initAnimation() {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 4,
    ).animate(_controller);

    _alignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.bottomCenter,
          end: Alignment.bottomCenter,
        ),
        weight: 1,
      ),
      TweenSequenceItem(
        tween:
            AlignmentTween(
              begin: Alignment.bottomCenter,
              end: const Alignment(0, -0.95),
            ).chain(
              CurveTween(curve: Curves.easeOut),
            ),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment(0, -0.95),
          end: Alignment.bottomCenter,
        ).chain(
          CurveTween(curve: Curves.easeIn)),
        weight: 0.8,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.bottomCenter,
          end: const Alignment(0, 0.6),
        ).chain(
          CurveTween(curve: Curves.easeOut)),
        weight: 0.5,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: const Alignment(0, 0.6),
          end: Alignment.bottomCenter,
        ).chain(
          CurveTween(curve: Curves.easeIn)),
        weight: 0.4,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.bottomCenter,
          end: Alignment(0, 0.9),
        ).chain(
          CurveTween(curve: Curves.easeOut)),
        weight: 0.25,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: const Alignment(0, 0.9),
          end: Alignment.bottomCenter,
        ).chain(
          CurveTween(curve: Curves.easeIn)),
        weight: 0.20,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.bottomCenter,
          end: Alignment(0, 0.95),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 0.15,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment(0, 0.95),
          end: Alignment.bottomCenter,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 0.09,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.bottomCenter,
          end: Alignment.bottomCenter,
        ).chain(
          CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('Animated Ball'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 129, 214, 238),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Align(
                    alignment: _alignmentAnimation.value,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value * math.pi,
                      child: child,
                    ),
                  );
                },
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(_ballPath, fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.lightGreen,
            ),
          ),
        ],
      ),
    );
  }
}
