import 'package:flutter/material.dart';
import 'package:games/_logic/global_settings.dart';
import 'package:games/_ui/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureProvider<GlobalSettings>(
      create: (_) => GlobalSettings.initNew(),
      lazy: false,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.brown,
          ),
          home: HomePage(),
        );
      },
    );
  }
}
