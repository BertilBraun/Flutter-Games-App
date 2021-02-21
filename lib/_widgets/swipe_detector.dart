import 'package:flutter/material.dart';
import 'package:games/slide_2048/slide_2048_settings.dart';

class SwipeDetector extends StatefulWidget {
  final Widget child;
  final Function() onSwipeUp;
  final Function() onSwipeDown;
  final Function() onSwipeLeft;
  final Function() onSwipeRight;

  SwipeDetector(
      {@required this.child,
        this.onSwipeUp,
        this.onSwipeDown,
        this.onSwipeLeft,
        this.onSwipeRight,});

  @override
  _SwipeDetectorState createState() => _SwipeDetectorState();
}

class _SwipeDetectorState extends State<SwipeDetector> {

  Offset position;
  Offset maxOffset;

  @override
  Widget build(BuildContext context) {

    return Listener(
      child: widget.child,
      onPointerDown: (details) {
        position = details.position;
        maxOffset = details.position - position;
      },
      onPointerMove: (details) {
        if ((details.position - position).distance > maxOffset.distance) {
          maxOffset = details.position - position;
        }
      },
      onPointerUp: (details) {

        if (maxOffset.distance < Settings.swipeThreshold) return;

        if (maxOffset.dx.abs() > maxOffset.dy.abs()) {
          if (maxOffset.dx.isNegative)
            widget.onSwipeLeft();
          else
            widget.onSwipeRight();
        } else {
          if (maxOffset.dy.isNegative)
            widget.onSwipeUp();
          else
            widget.onSwipeDown();
        }
      },
    );
  }
}