import 'package:flutter/material.dart';
import 'package:your_basket/Screens/cartScreen.dart';
import 'package:your_basket/Screens/categoryScreen.dart';
import 'package:your_basket/Screens/productItemScreen.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';
import 'package:your_basket/utils/theme.dart';
import 'Screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Globals().setContext(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      routes: {
        '/homepage': (context) => const HomeScreen(),
        '/productItemPage': (context) => ProductItemScreen(),
        // '/catalogueScreen'
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
      body: const CategoryScreen(),
    );
  }
}
