import 'package:firebase_core/firebase_core.dart';
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
import 'package:your_basket/Screens/ReferEarn.dart';
import 'package:your_basket/Widgets/Sinners/loadingsinner.dart';
import 'package:your_basket/utils/theme.dart';
import 'Screens/OrderFailureScreen.dart';
import 'Screens/homeScreen.dart';
import 'Screens/internetConnection.dart';
import 'Screens/introAnimationScreen.dart';
import 'Screens/searchScreen.dart';
import 'firebase_options.dart';
import 'notificationservice/local_notification_service.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
// import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> backgroundHandler(RemoteMessage message) async {}

Future<void> main() async {
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
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
      title: 'Basko',
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      home: const ConnectionScreen(
        child: MyHomePage(),
      ),
      // initialRoute: '/',
      routes: {
        // '/': (context) => MyHomePage(),
        '/introScreen': (context) => const IntroScreen(),
        '/loading': (context) => const ConnectionScreen(child: LoadingSinner()),
        '/homepage': (context) => const HomeScreen(),
        '/categoryScreen': (context) => ConnectionScreen(
              child: CategoryScreen(
                mainCategoryId: "63e00827b56990c02866bba5",
              ),
            ),
        '/productItemPage': (context) => const ConnectionScreen(
            child: ConnectionScreen(child: ProductItemScreen())),
        '/cartScreen': (context) => const ConnectionScreen(child: CartScreen()),
        '/searchScreen': (context) => const SearchScreen(),
        '/profileScreen': (context) =>
            const ConnectionScreen(child: ProfileScreen()),
        '/yourOrderScreen': (context) =>
            const ConnectionScreen(child: YourOrderes()),
        '/otpScreen': (context) => const OtpScreen(),
        '/addressScreen': (context) =>
            const ConnectionScreen(child: AddressBook()),
        '/offerScreen': (context) =>
            const ConnectionScreen(child: OfferScreen()),
        '/ordersuccessScreen': (context) =>
            const ConnectionScreen(child: OrderSuuccess()),
        '/orderfailureScreen': (context) => const OrderFailure(),
        '/loginScreen': (context) => const LoginScreen(),
        // '/refferalloginScreen': (context) => RefferalLogin(),
        '/orderSummaryScreen': (context) =>
            ConnectionScreen(child: OrderSummaryScreen()),
        '/checkoutScreen': (context) =>
            ConnectionScreen(child: CheckoutScreen()),
        '/subscriptionScreen': (context) =>
            const ConnectionScreen(child: SubscriptionScreen()),
        '/buySubscriptionScreen': (context) =>
            const ConnectionScreen(child: BuySubscriptionScreen()),
        '/referearnScreen': (context) =>
            ConnectionScreen(child: ReferEarnScreen()),
        '/introAnimationScreen': (context) => const IntroAnimationScreen(),
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
    String? username = prefs.getString('phonenumber');
    // bool? _seen = (prefs.getBool('seen'));

    if (username != null) {
      // setState(() {

      // });
      // Config.phonenumber = username;
      return '/homepage';
    } else {
      return '/intoAnimationScreen';
    }

    // if (_seen != null) {
    //   return '/homepage';
    // } else {
    //   await prefs.setBool('seen', true);
    //   return '/introScreen';
    // }
  }

  @override
  void initState() {
    super.initState();

// 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        if (message != null) {
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
        if (message.notification != null) {
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

// 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        if (message.notification != null) {}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkFirstSeen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.data != null) {
              return const IntroAnimationScreen();
            } else {
              return const IntroScreen();
            }
          }
        });
    // return HomeScreen();
  }
}
