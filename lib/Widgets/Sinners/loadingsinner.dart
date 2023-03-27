import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSinner extends StatelessWidget {
  const LoadingSinner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitThreeInOut(
          color: Colors.green,
        ),
      ),
    );
  }
}
