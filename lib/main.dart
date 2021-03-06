// ignore_for_file: avoid_print

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teststore/components/map_screen.dart';
import 'package:teststore/components/tab_bar.dart';
import 'package:teststore/core/helpers/navigation/nav_helper.dart';
import 'package:teststore/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:teststore/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:teststore/locator_service.dart' as di;

import 'features/cart/presentation/pages/cart_bloc_screen.dart';
import 'features/detail/presentation/pages/deteils_bloc_screen.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/pages/home_bloc_screen.dart';
import 'locator_service.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // if (message.data['type'] == 'detail') {
  //   NavigatorKeyHelper.navigatorKey.currentState!.pushNamed('/detail');
  // }
  await FirebaseAnalytics.instance.logEvent(name: 'Notification open');
  NavigatorHelper.pushToDetail();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  final PendingDynamicLinkData? initialLink =
      await FirebaseDynamicLinks.instance.getInitialLink();

  runApp(MyApp(
    initialLink: initialLink,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({required this.initialLink, Key? key}) : super(key: key);

  final PendingDynamicLinkData? initialLink;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PendingDynamicLinkData? get initialLink {
    if (initialLink != null) {
      final Uri deepLink = initialLink!.link;
      print(deepLink.path);
      if (deepLink.path == '/explorer') {
        changeScreen(0);
      } else {
        NavigatorHelper.pushToNamedRoute(deepLink.path);
      }
    }
    return null;
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) async {
    await FirebaseAnalytics.instance.logEvent(name: 'Notification open');
    NavigatorHelper.pushToDetail();
  }

  @override
  void initState() {
    super.initState();

    setupInteractedMessage();

    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      print(dynamicLinkData.link.path);
      NavigatorHelper.pushToNamedRoute(dynamicLinkData.link.path);
    });
  }

  int selectedIndex = 0;

  final screens = [
    const HomeBLoCScreen(),
    const Center(child: Text('page under construction')),
    const Center(child: Text('page under construction')),
    const MapScreen(),
    // const Center(child: Text('page under construction')),
  ];

  changeScreen(int index) {
    if (index != 1) {
      setState(() {
        selectedIndex = index;
      });
    }
    if (index == 1) {
      NavigatorHelper.pushToCart();
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
        navigatorKey: NavigatorHelper.navigatorKey,
        theme: (AppLocalizations.of(context)?.language ?? '') == 'English' ? ThemeData(fontFamily: 'MarkPro') : null,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
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
