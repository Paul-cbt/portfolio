library swipe_up;

import 'package:flutter/material.dart';

class PlayMusic extends StatefulWidget {
  final Widget body;
  final Widget child;
  final VoidCallback onSwipe;
  final double sensitivity;
  final bool showArrow;
  final Color color;
  final bool animate;
  final bool expand;
  PlayMusic(
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
  _PlayMusicState createState() => _PlayMusicState();
}

class _PlayMusicState extends State<PlayMusic>
    with SingleTickerProviderStateMixin {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  late double _initialOffset;
  late double _swipeOffset;

  late AnimationController _animationController;
  late CurvedAnimation _animation;

  @override
  void initState() {
    _initialOffset = 0.0;
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
        duration: Duration(milliseconds: 3000), vsync: this);
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.25, curve: Curves.decelerate));

    _animationController.repeat(
        reverse: true, period: Duration(milliseconds: 3500));
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
          left: MediaQuery.of(context).size.width -
              170 +
              (widget.animate
                  ? (_swipeOffset / 2) +
                      (MediaQuery.of(context).size.width /
                          40 *
                          (1 - _animation.value))
                  : _swipeOffset / 2),
          bottom: 3,
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: widget.expand
                        ? Transform.scale(
                            scale: 1 +
                                (_swipeOffset *
                                    2 /
                                    (MediaQuery.of(context).size.height)),
                            child: widget.child)
                        : widget.child),
                widget.showArrow
                    ? Icon(Icons.keyboard_arrow_right, color: widget.color)
                    : Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
