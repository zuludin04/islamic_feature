import 'package:flutter/material.dart';

class RippleAnimation extends StatefulWidget {
  final String count;
  final double width;
  final double height;

  const RippleAnimation({
    Key? key,
    required this.count,
    this.width = 200,
    this.height = 200,
  }) : super(key: key);

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 2.0, end: 15.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RippleAnimation oldWidget) {
    _animationController.reset();
    _animationController.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xffc8e6c9),
            blurRadius: _animation.value,
            spreadRadius: _animation.value,
          ),
        ],
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: widget.count,
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            children: const [
              TextSpan(
                text: '/33',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
