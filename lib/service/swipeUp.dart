// ignore_for_file: unnecessary_null_comparison

library swipe_up;

import 'package:flutter/material.dart';

class SwipeUp extends StatefulWidget {
  final Widget body;
  final Widget child;
  final VoidCallback onSwipe;
  final double sensitivity;
  final bool showArrow;
  final Color color;
  final bool animate;
  final bool expand;
  SwipeUp(
      {required this.body,
      required this.child,
      required this.onSwipe,
      this.sensitivity = 0.5,
      this.showArrow = true,
      this.color = Colors.black54,
      this.animate = true,
      this.expand = true})
      : assert(sensitivity > 0 && sensitivity <= 1),
        assert(child != null),
        assert(body != null);
  @override
  _SwipeUpState createState() => _SwipeUpState();
}

class _SwipeUpState extends State<SwipeUp> with SingleTickerProviderStateMixin {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  late double _swipeOffset;

  late AnimationController _animationController;
  late CurvedAnimation _animation;

  @override
  void initState() {
    _swipeOffset = 0.0;
    if (widget.animate) initialAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void initialAnimation() {
    _animationController = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.25, curve: Curves.decelerate));

    _animationController.repeat(
        reverse: true, period: Duration(milliseconds: 2000));
    _animation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.body,
        Positioned(
          bottom: (widget.animate
                  ? (_swipeOffset / 2) +
                      (MediaQuery.of(context).size.height /
                          40 *
                          (1 - _animation.value))
                  : _swipeOffset / 2) +
              (MediaQuery.of(context).size.width > 400 ? 0 : 30),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              widget.showArrow
                  ? Icon(Icons.keyboard_arrow_up, color: widget.color)
                  : Container(),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 240,
                      bottom: MediaQuery.of(context).size.height / 40),
                  child: widget.expand
                      ? Transform.scale(
                          scale: 1 +
                              (_swipeOffset *
                                  2 /
                                  (MediaQuery.of(context).size.height)),
                          child: widget.child)
                      : widget.child)
            ],
          ),
        ),
      ],
    );
  }
}
