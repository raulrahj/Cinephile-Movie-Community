import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ProgressCircle extends StatefulWidget {
  const ProgressCircle({Key? key}) : super(key: key);
  @override
  State<ProgressCircle> createState() => _ProgressCircleState();
}

class _ProgressCircleState extends State<ProgressCircle>
    with SingleTickerProviderStateMixin {
  // AnimationController? controller;
  // Animation<double>? animationRotation;
  double radius = 10.0;
  final double initialRadius = 30.0;

  // @override
  // void initState() {
  //   super.initState();
  late final AnimationController controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 650))
    ..repeat();
  late final Animation<double> animationRotation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 1.0, curve: Curves.linear)));
  // controller.addListener(() {

  // });
  // controller!.repeat();
  // }
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.grey[700],
            border: Border.all(style: BorderStyle.solid, color: Colors.black12),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: RotationTransition(
            turns: animationRotation,
            child: Stack(
              children: [
                const Dot(
                  radious: 8.0,
                  color: Colors.black,
                  border: Border.symmetric(),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(1 * pi / 2.5), radius * sin(1 * pi / 2.5)),
                  child: const Dot(),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(2 * pi / 2.5), radius * sin(2 * pi / 2.5)),
                  child: const Dot(),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(3 * pi / 2.5), radius * sin(3 * pi / 2.5)),
                  child: const Dot(),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(4 * pi / 2.5), radius * sin(4 * pi / 2.5)),
                  child: const Dot(),
                ),
                Transform.translate(
                  offset: Offset(
                      radius * cos(5 * pi / 2.5), radius * sin(5 * pi / 2.5)),
                  child: const Dot(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double? radious;
  final Color? color;
  final Border? border;
  const Dot({Key? key, this.radious, this.color, this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radious ?? 8,
        height: radious ?? 8,
        decoration: BoxDecoration(
            border: border ?? Border.all(),
            color: color ?? Colors.white54,
            shape: BoxShape.circle),
      ),
    );
  }
}
