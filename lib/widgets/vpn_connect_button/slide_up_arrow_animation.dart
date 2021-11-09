import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class AnimatedSlideUpArrow extends StatefulWidget {
  const AnimatedSlideUpArrow({
    this.beginPosition = 20,
    this.endPosition = 50,
    this.boxRotation = -1,
  });

  final double beginPosition;
  final double endPosition;
  final int boxRotation;

  @override
  _AnimatedSlideUpArrowState createState() => _AnimatedSlideUpArrowState();
}

class _AnimatedSlideUpArrowState extends State<AnimatedSlideUpArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _position;
  late Animation<double> _opacity;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _position = Tween<double>(
      begin: widget.beginPosition,
      end: widget.endPosition,
    ).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0, 1)),
    )..addListener(() {
        setState(() {});
      });

    _opacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(.5, 1)),
    )..addListener(() {
        setState(() {});
      });
    // Always repeat animation
    _controller.repeat();
    // _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: widget.boxRotation,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: _position.value),
            child: Opacity(
              opacity: _opacity.value,
              child: const Icon(
                CommunityMaterialIcons.chevron_double_up,
                color: Color(0xFFbbc8ee),
                size: 38,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
