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
      color: Color.fromRGBO(243, 243, 243, 1),
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
                      'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Icons%2Fbottomnavbar%2Fhome-icon.png?alt=media&token=13a30502-d306-4391-a39e-e578a61c0b9c',
                ),
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
                      'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Icons%2Fbottomnavbar%2Fcart-icon.png?alt=media&token=2575b106-0e6a-4db5-9c3e-ba05f410da4b',
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
                      'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Icons%2Fbottomnavbar%2Fsubscription-icon.png?alt=media&token=443c2fd5-915f-4707-b234-7516ca6bcac4',
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
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Icons%2Fbottomnavbar%2Fuser-icon.png?alt=media&token=58c01f7d-874b-4208-bd9f-52e15b15d836',
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
