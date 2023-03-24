import 'package:cached_network_image/cached_network_image.dart';
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
            ? CachedNetworkImage(
                height: scHeight * 0.4,
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Screens%2FNoItem%2Floginfirst2.png?alt=media&token=6d8fd382-93b3-4031-966d-85291540d926')
            : CachedNetworkImage(
                height: scHeight * 0.4,
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Screens%2FNoItem%2Femptylist.png?alt=media&token=4f834d3f-2064-47a3-b9c6-9dce502aa65e'),
        // SizedBox(
        //   height: 20,
        // ),
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
                    backgroundColor: Theme.of(context).primaryColor),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/homepage', (Route<dynamic> route) => false);
                },
                child: const Text('Shop Now')),
        SizedBox(
          height: 40,
        )
      ]),
    );
  }
}
