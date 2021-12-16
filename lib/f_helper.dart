import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class NavigatorKeyHelper {
  // static FirebaseApp? _fa;
  // get fa async {
  //   if (_fa != null) return _fa!;
  //   _fa = await intFA();
  //   return _fa!;
  // }

  // intFA() async {
  //   var theFA = await Firebase.initializeApp();
  //   return theFA;
  // }
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}