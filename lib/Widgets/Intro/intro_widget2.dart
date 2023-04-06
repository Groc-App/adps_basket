import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Container(
        alignment: const Alignment(0, -0.8),
        child: Column(
          children: [
            Lottie.network(
                'https://assets7.lottiefiles.com/packages/lf20_HmRWcatRRk.json',
                height: scHeight * 0.7),
            Container(
                transform: Matrix4.rotationZ(6.180),
                margin: const EdgeInsets.only(left: 30, right: 35, top: 20),
                child: Text(
                  'Susbscibe products to get daily in morning before 9AM',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w900),
                )),
          ],
        ));
  }
}
