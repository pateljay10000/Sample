import 'package:flutter/material.dart';
import 'package:sample/styles/colors.dart';

class AnimatedDigitBox extends StatefulWidget {
  final int digit;

  AnimatedDigitBox({required this.digit});

  @override
  _AnimatedDigitBoxState createState() => _AnimatedDigitBoxState();
}

class _AnimatedDigitBoxState extends State<AnimatedDigitBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Container(
            margin: const EdgeInsets.all(2),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: ThemeColors.yellowAppBarColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                widget.digit.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}