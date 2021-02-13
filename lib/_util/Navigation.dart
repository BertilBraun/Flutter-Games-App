

import 'package:flutter/material.dart';

class Navigation {
  static Future push(BuildContext context, Widget page) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }
}