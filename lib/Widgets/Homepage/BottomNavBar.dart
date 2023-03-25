// import 'package:flutter/material.dart';
// ignore_for_file: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotmNavBar extends StatelessWidget {
  const BotmNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 8.0,
      height: 60,
      shape: CircularNotchedRectangle(),
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
                // Icon(
                //   FontAwesomeIcons.houseChimney,
                //   size: 22,
                // ),
                // ImageIcon(
                //   CachedNetworkImageProvider(
                //       'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Icons%2Fbottomnavbar%2Fhome-icon.png?alt=media&token=13a30502-d306-4391-a39e-e578a61c0b9c'),
                //   size: 22,
                //   color: Colors.amber,
                // ),
                CachedNetworkImage(
                  height: 22,
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Icons%2Fbottomnavbar%2Fhome-icon-B.png?alt=media&token=1f0f9df4-31cf-492d-a38c-3a408358a011',
                ),
                // CachedNetworkImage(
                //   height: 22,
                //   imageUrl:
                //       'https://img.icons8.com/external-others-inmotus-design/67/null/external-B-keyboard-others-inmotus-design-10.png',
                // ),
                Text(
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
                Text(
                  'Cart',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(
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
                Text(
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
                Text(
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
