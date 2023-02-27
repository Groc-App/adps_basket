import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  const Quote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment(0, 0),
      child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            '\'\'Apple a day, keeps doctor away,,',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.green[400]),
          )),
    );
  }
}
