// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '🙁',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Opps! Something went wrong.',
            style: TextStyle(
                fontSize: 19, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Please report and try again later.',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 7,
          ),
          ElevatedButton(
              onPressed: () async {
                var contact = "+917988923447";
                var androidUrl = "https://wa.me/$contact?text=Hey, Basko Man!!";
                await launch(androidUrl);
              },
              child: const Text('Report')),
        ],
      ),
    );
  }
}
