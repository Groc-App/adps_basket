import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Screens/OrderSuccess.dart';
import 'package:your_basket/Screens/ProfileScreen.dart';
import 'package:your_basket/Screens/cartScreen.dart';
import 'package:your_basket/Screens/categoryScreen.dart';
import 'package:your_basket/Screens/loginScreen.dart';
import 'package:your_basket/Screens/otpScreen.dart';
import 'package:your_basket/Screens/productItemScreen.dart';
import 'package:your_basket/Screens/yourOrders.dart';
import 'package:your_basket/utils/theme.dart';
import 'Screens/homeScreen.dart';
import 'Screens/searchScreen.dart';
import 'Widgets/Address/address.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Globals().setContext(context);
    return MaterialApp(
      title: 'Your Basket',
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      routes: {
        '/homepage': (context) => const HomeScreen(),
        '/categoryScreen': (context) => CategoryScreen(),
        '/productItemPage': (context) => ProductItemScreen(),
        '/cartScreen': (context) => CartScreen(),
        '/searchScreen': (context) => SearchScreen(),
        '/profileScreen': (context) => ProfileScreen(),
        '/yourOrderScreen': (context) => YourOrderes(),
        '/otpScreen': (context) => OtpScreen(),
        '/addressScreen': (context) => Address(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: ProductItemScreen(),
    );
  }
}
