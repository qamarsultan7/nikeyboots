import 'package:flutter/material.dart';

class SlideTransitionController {
  static late AnimationController _controller;
  late Animation<Offset> _animation;
  
  SlideTransitionController(TickerProvider sync, Duration duration,Offset offset) {
    _controller = AnimationController(
      vsync: sync,
      duration: duration,
      reverseDuration: const Duration(milliseconds: 700)
    );
    _animation = Tween<Offset>(
            begin:  offset , end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }
  Animation<Offset> get animation => _animation;
  AnimationController get controller => _controller;
  void dispose() {
    _controller.dispose();
  }
}
