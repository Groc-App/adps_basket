// import 'package:flutter/material.dart';
// ignore_for_file: file_names
import 'package:flutter/material.dart';

class BotmNavBar extends StatelessWidget {
  const BotmNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 8.0,
      height: 60,
      shape: CircularNotchedRectangle(),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                constraints: BoxConstraints(),
                tooltip: 'Home',
                padding: EdgeInsets.all(0),
                icon: Icon(Icons.home),
              ),
              Text('Home')
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cartScreen');
                },
                constraints: BoxConstraints(),
                tooltip: 'Cart',
                padding: EdgeInsets.all(0),
                icon: Icon(Icons.shopping_bag),
              ),
              Text('Cart')
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/subscriptionScreen');
                  },
                  constraints: BoxConstraints(),
                  tooltip: 'Subscription',
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.subscript),
                ),
                Text('Subs')
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                constraints: BoxConstraints(),
                tooltip: 'Profile',
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pushNamed(context, '/profileScreen');
                },
                icon: Icon(Icons.verified_user),
              ),
              Text('Profile')
            ],
          ),
        ],
      ),
    );
  }
}
