import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_basket/Screens/OrderSuccess.dart';
import 'package:your_basket/Screens/ProfileScreen.dart';
import 'package:your_basket/Screens/addressScreen.dart';
import 'package:your_basket/Screens/buySubscriptionScreen.dart';
import 'package:your_basket/Screens/cartScreen.dart';
import 'package:your_basket/Screens/categoryScreen.dart';
import 'package:your_basket/Screens/checkOutScreen.dart';
import 'package:your_basket/Screens/intro_screen.dart';
import 'package:your_basket/Screens/loginScreen.dart';
import 'package:your_basket/Screens/offerScreen.dart';
import 'package:your_basket/Screens/orderSummary.dart';
import 'package:your_basket/Screens/otpScreen.dart';
import 'package:your_basket/Screens/productItemScreen.dart';
import 'package:your_basket/Screens/subscriptionScreen.dart';
import 'package:your_basket/Screens/yourOrders.dart';
import 'package:your_basket/Widgets/Sinners/loadingsinner.dart';
import 'package:your_basket/utils/theme.dart';
import 'Screens/homeScreen.dart';
import 'Screens/searchScreen.dart';
import 'firebase_options.dart';
import 'notificationservice/local_notification_service.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  runApp(
    ProviderScope(child: const MyApp()),
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
      // home: const MyHomePage(),
      initialRoute: '/loginScreen',
      routes: {
        '/': (context) => MyHomePage(),
        '/introScreen': (context) => const IntroScreen(),
        '/loading': (context) => const LoadingSinner(),
        '/homepage': (context) => const HomeScreen(),
        '/categoryScreen': (context) => CategoryScreen(
              mainCategoryId: "63e00827b56990c02866bba5",
            ),
        '/productItemPage': (context) => ProductItemScreen(),
        '/cartScreen': (context) => CartScreen(),
        '/searchScreen': (context) => SearchScreen(),
        '/profileScreen': (context) => ProfileScreen(),
        '/yourOrderScreen': (context) => YourOrderes(),
        '/otpScreen': (context) => OtpScreen(),
        '/addressScreen': (context) => AddressBook(),
        '/offerScreen': (context) => OfferScreen(),
        '/ordersuccessScreen': (context) => OrderSuuccess(),
        '/loginScreen': (context) => LoginScreen(),
        '/orderSummaryScreen': (context) => OrderSummaryScreen(),
        '/checkoutScreen': (context) => CheckoutScreen(),
        '/subscriptionScreen': (context) => SubscriptionScreen(),
        '/buySubscriptionScreen': (context) => BuySubscriptionScreen(),
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
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      return '/';
    } else {
      await prefs.setBool('seen', true);
      return '/introScreen';
    }
  }

  @override
  void initState() {
    super.initState();

// 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

// 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkFirstSeen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.data == '/')
              return HomeScreen();
            else {
              return IntroScreen();
            }
          }
        });
    ;
  }
}
