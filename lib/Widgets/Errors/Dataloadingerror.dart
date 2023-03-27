import 'package:flutter/material.dart';

class DataError extends StatelessWidget {
  const DataError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      height: 200,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '🙁',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Opps! Something went wrong.',
            style: TextStyle(
                fontSize: 19, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Please report and try again later.',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
