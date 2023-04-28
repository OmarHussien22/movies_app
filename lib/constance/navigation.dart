import 'package:flutter/material.dart';

class Move {
  static nativeNavigatePush(context, Widget child) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => child,
      ));
  static nativeNavigateReplacment(context, Widget child) =>
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => child,
          ));
  static nativeNavigateRemoveAll(context, Widget child) =>
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => child), (route) => false);
}
