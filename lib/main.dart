// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teststore/components/tab_bar.dart';
import 'package:teststore/f_helper.dart';
import 'package:teststore/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:teststore/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:teststore/locator_service.dart' as di;

import 'features/cart/presentation/pages/cart_bloc_screen.dart';
import 'features/detail/presentation/pages/deteils_bloc_screen.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/pages/home_bloc_screen.dart';
import 'locator_service.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // if (message.data['type'] == 'detail') {
  //   NavigatorKeyHelper.navigatorKey.currentState!.pushNamed('/detail');
  // }
  NavigatorKeyHelper.navigatorKey.currentState!.pushNamed('/detail');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> setupInteractedMessage() async {
    // FirebaseMessaging messaging = FirebaseMessaging.instance;

    // NotificationSettings settings = await messaging.requestPermission(
    //   alert: true,
    //   announcement: false,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
      NavigatorKeyHelper.navigatorKey.currentState!.pushNamed('/detail');
  }

  @override
  void initState() {
    super.initState();

    setupInteractedMessage();
  }

  int selectedIndex = 0;

  final screens = [
    const HomeBLoCScreen(),
    const Center(child: Text('page under construction')),
    const Center(child: Text('page under construction')),
    const Center(child: Text('page under construction')),
  ];

  changeScreen(int index) {
    if (index != 1) {
      setState(() {
        selectedIndex = index;
      });
    }
    if (index == 1) {
      NavigatorKeyHelper.navigatorKey.currentState!.pushNamed('/cart');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => sl<HomeBloc>()..add(LoadHomeScreenEvent()),
        ),
        BlocProvider<DetailBloc>(
          create: (context) => sl<DetailBloc>()..add(LoadDetailScreenEvent()),
        ),
        BlocProvider<CartBloc>(
          create: (context) => sl<CartBloc>()..add(LoadCartScreenEvent()),
        ),
      ],
      child: MaterialApp(
        navigatorKey: NavigatorKeyHelper.navigatorKey,
        theme: ThemeData(fontFamily: 'MarkPro'),
        home: Scaffold(
          body: screens[selectedIndex],
          bottomNavigationBar: CustomBottomNavBar(
            index: selectedIndex,
            changeScreen: changeScreen,
          ),
        ),
        routes: {
          // '/': (context) => const FirstScreen(),
          '/detail': (context) => const DetailsBLoCScreen(),
          '/cart': (context) => const CartBLoCScreen(),
        },
      ),
    );
  }
}
