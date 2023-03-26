import 'dart:async';

import 'package:flutter/material.dart';

class IntroAnimationScreen extends StatefulWidget {
  @override
  _IntroAnimationScreenState createState() => _IntroAnimationScreenState();
}

class _IntroAnimationScreenState extends State<IntroAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();

    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/homepage');
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }
}
