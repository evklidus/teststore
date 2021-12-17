import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class NavigatorHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  var firebaseAnalytics = FirebaseAnalytics.instance;
      
   pushToDetail() async {
    await firebaseAnalytics.logEvent(name: 'Detail');
    NavigatorHelper.navigatorKey.currentState!.pushNamed('/detail');
    // FirebaseAnalytics.instance.logEvent(name: 'Detail');
  }

  static pushToCart() {
    NavigatorHelper.navigatorKey.currentState!.pushNamed('/cart');
    FirebaseAnalytics.instance.setCurrentScreen(screenName: 'Cart');
  }
}
