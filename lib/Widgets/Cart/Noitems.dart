import 'package:flutter/material.dart';

class NoItems extends StatelessWidget {
  // const NoItems({super.key});
  final noitemtext;
  final pageroute;

  NoItems({this.noitemtext, this.pageroute});

  @override
  Widget build(BuildContext context) {
    print(pageroute);
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    https: //img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?w=2000
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        noitemtext == 'Login/SignUp First'
            ? Image.network(
                height: scHeight * 0.4,
                'https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?w=2000')
            : Image.network(
                height: scHeight * 0.4,
                'https://assets.materialup.com/uploads/16e7d0ed-140b-4f86-9b7e-d9d1c04edb2b/preview.png'),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            '$noitemtext',
            style: TextStyle(fontSize: 20),
          ),
        ),
        pageroute == 'loginpage'
            ? ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/loginScreen');
                },
                child: Text('Login'))
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(83, 177, 117, 1)),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/homepage', (Route<dynamic> route) => false);
                },
                child: const Text('Shop Now')),
      ]),
    );
  }
}
