import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTransition extends CustomTransitionPage {
  AppTransition({required super.child})
    : super(
        transitionDuration: .new(milliseconds: 100),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
              Tween(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeInOut)),
            ),
            child: ScaleTransition(
              scale: animation.drive(
                Tween(
                  begin: 0.95,
                  end: 1.0,
                ).chain(CurveTween(curve: Curves.easeOutCubic)),
              ),
              child: child,
            ),
          );
        },
      );
}
