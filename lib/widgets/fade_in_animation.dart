import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  const FadeInAnimation(
      {super.key,
        required this.child,
        required this.animationPosition,
        required this.delayInMs,
        required this.durationInMs});
  final Widget child;
  final MyAnimation animationPosition;
  final int durationInMs, delayInMs;

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> {
  bool? animate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeAnimation();
  }

  Future changeAnimation() async {
    animate = false;
    await Future.delayed(Duration(milliseconds: widget.delayInMs));
    if (mounted) {
      setState(() {
        animate = true;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      child: widget.child,
      duration: Duration(milliseconds: widget.durationInMs),
      curve: Curves.easeInOut,
      top: animate!
          ? widget.animationPosition.topAfter
          : widget.animationPosition.topBefore,
      left: animate!
          ? widget.animationPosition.leftAfter
          : widget.animationPosition.leftBefore,
      bottom: animate!
          ? widget.animationPosition.bottomAfter
          : widget.animationPosition.bottomBefore,
      right: animate!
          ? widget.animationPosition.rightAfter
          : widget.animationPosition.rightBefore,
    );
  }
}

class MyAnimation {
  final double? topAfter, leftAfter, bottomAfter, rightAfter;
  final double? topBefore, leftBefore, bottomBefore, rightBefore;

  MyAnimation(
      {this.topAfter,
        this.leftAfter,
        this.bottomAfter,
        this.rightAfter,
        this.topBefore,
        this.leftBefore,
        this.bottomBefore,
        this.rightBefore});
}