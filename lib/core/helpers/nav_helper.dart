import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class NavigatorHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // var firebaseAnalytics = FirebaseAnalytics.instance;
      
   static pushToDetail() async {
    await FirebaseAnalytics.instance.setCurrentScreen(screenName: 'Detail Screen');
    NavigatorHelper.navigatorKey.currentState!.pushNamed('/detail');
  }

  static pushToCart() async {
    await FirebaseAnalytics.instance.setCurrentScreen(screenName: 'Cart');
    NavigatorHelper.navigatorKey.currentState!.pushNamed('/cart');
  }
}
