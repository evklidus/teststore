import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class NavigatorHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static pushToDetail() {
    NavigatorHelper.navigatorKey.currentState!.pushNamed('/detail');
    FirebaseAnalytics.instance.setCurrentScreen(screenName: 'Detail');
  }

  static pushToCart() {
    NavigatorHelper.navigatorKey.currentState!.pushNamed('/cart');
    FirebaseAnalytics.instance.setCurrentScreen(screenName: 'Cart');
  }
}
