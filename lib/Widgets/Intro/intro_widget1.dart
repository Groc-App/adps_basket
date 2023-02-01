import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Container(
        alignment: const Alignment(0, -0.8),
        child: Column(
          children: [
            Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_3tryizhw.json',
                height: scHeight * 0.7),
            Container(
                transform: Matrix4.rotationZ(6.15),
                margin: const EdgeInsets.only(left: 30, right: 35, top: 20),
                child: const Text(
                  'Things at your doorstep everyday before 8 AM',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.purple,
                      fontWeight: FontWeight.w900),
                )),
          ],
        ));
  }
}
