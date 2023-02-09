import 'package:flutter/material.dart';

class InternetConnection extends StatelessWidget {
  const InternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/noInternet.jpg'),
              ),
            ),
          ),
          const Text(
            "No Internet Connection",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Could not connect to the Internet. Please chech your network.",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
