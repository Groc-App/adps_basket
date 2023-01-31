import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    final sc_size = MediaQuery.of(context).size;
    final sc_width = sc_size.width;
    final sc_height = sc_size.height;

    return Container(
        alignment: Alignment(0, -0.8),
        child: Column(
          children: [
            Lottie.network(
                'https://assets7.lottiefiles.com/packages/lf20_HmRWcatRRk.json',
                height: sc_height * 0.7),
            Container(
                transform: Matrix4.rotationZ(6.180),
                margin: EdgeInsets.only(left: 30, right: 35, top: 20),
                child: Text(
                  'Order your needs before 6 AM',
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
