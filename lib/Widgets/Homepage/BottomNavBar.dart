// import 'package:flutter/material.dart';
// ignore_for_file: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BotmNavBar extends StatelessWidget {
  const BotmNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 8.0,
      height: 60,
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  height: 22,
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Logo%2FNew%2Flogo%20png%202.png?alt=media&token=c9f57ebd-d2e6-402b-8844-3758029d9258',
                ),
                const Text(
                  'Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/cartScreen');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  height: 22,
                  imageUrl:
                      'https://img.icons8.com/pastel-glyph/64/null/shopping-cart--v2.png',
                ),
                const Text(
                  'Cart',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/subscriptionScreen');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  height: 22,
                  imageUrl:
                      'https://img.icons8.com/ios/50/null/tear-off-calendar--v1.png',
                ),
                const Text(
                  'Subs',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profileScreen');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  height: 22,
                  imageUrl: 'https://img.icons8.com/windows/48/null/user.png',
                ),
                const Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
