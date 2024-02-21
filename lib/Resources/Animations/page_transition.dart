import 'package:flutter/material.dart';

PageRouteBuilder slideTransitionPageRoute(
  Widget page,
  Offset begin,
  Offset end,
  Curve curve,
  Duration duration,
) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    reverseTransitionDuration: duration,
    transitionDuration: duration,
  );
}
