import 'package:flutter/material.dart';
import 'package:games/_logic/global_settings.dart';
import 'package:games/_ui/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
