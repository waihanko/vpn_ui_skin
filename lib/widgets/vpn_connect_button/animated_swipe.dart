import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpn_ui_skin/widgets/vpn_connect_button/slide_up_arrow_animation.dart';

class AnimatedSwipeToConfirm extends StatefulWidget {
  const AnimatedSwipeToConfirm({
    Key? key,
    this.height = 80,
    this.borderWidth = 3,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  final double? height;
  final double? borderWidth;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  _AnimatedSwipeToConfirmState createState() => _AnimatedSwipeToConfirmState();
}

class _AnimatedSwipeToConfirmState extends State<AnimatedSwipeToConfirm> {
  late double _maxWidth;
  late double _handleSize;
  double _dragValue = 0;
  double _dragWidth = 0;
  bool _confirmed = false;

  @override
  Widget build(BuildContext context) {
    _handleSize = (widget.height! - (widget.borderWidth! * 2));
    return LayoutBuilder(builder: (context, constraint) {
      _maxWidth = constraint.maxWidth;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: widget.height,
        decoration: BoxDecoration(
          color: const Color(0xffF7F8FF),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: const Color(0xffF7F8FF),
            width: widget.borderWidth!,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment:
                    _confirmed ? Alignment.centerLeft : Alignment.centerRight,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    _confirmed ? "OFF" : "ON",
                    style: const TextStyle(
                        color: Color(0xff3352C1),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: _confirmed
                  ? const EdgeInsets.only(right: 20)
                  : const EdgeInsets.only(left: 20),
              child: Center(
                child: _confirmed
                    ? const AnimatedSlideUpArrow(
                        beginPosition: 20,
                        endPosition: 8,
                        boxRotation: -1,
                      )
                    : const AnimatedSlideUpArrow(
                        beginPosition: 8,
                        endPosition: 20,
                        boxRotation: 1,
                      ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 0),
              width: _dragWidth <= _handleSize ? _handleSize : _dragWidth,
              child: Row(
                children: [
                  const Expanded(child: SizedBox.shrink()),
                  GestureDetector(
                    onVerticalDragUpdate: _onDragUpdate,
                    onVerticalDragEnd: _onDragEnd,
                    child: SizedBox(
                      width: _handleSize,
                      height: _handleSize,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: SvgPicture.asset(
                          _confirmed
                              ? "assets/icons/active.svg"
                              : "assets/icons/inactive.svg",
                          width: _handleSize,
                          height: _handleSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragValue = 180 / (details.globalPosition.dy);
      _dragWidth = _maxWidth * _dragValue;
    });
  }

  void _onDragEnd(DragEndDetails details) {
    if (_dragValue > .5) {
      _dragValue = 1;
    } else {
      _dragValue = 0;
    }

    setState(() {
      _dragWidth = _maxWidth * _dragValue;
      _confirmed = _dragValue == 1;
    });

    if (_dragValue == 1) {
      widget.onConfirm();
    } else {
      widget.onCancel();
    }
  }
}
