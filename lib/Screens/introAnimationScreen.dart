// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:your_basket/main.dart';

class IntroAnimationScreen extends StatefulWidget {
  const IntroAnimationScreen({super.key});

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
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();

    Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacementNamed(context, '/my');
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
            child: Image.network(
                height: 160,
                "https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Logo%2FNew%2Flogo%20png%202.png?alt=media&token=c9f57ebd-d2e6-402b-8844-3758029d9258")),
      ),
    );
  }
}
