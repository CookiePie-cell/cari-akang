import 'package:cari_akang/router_generator.dart';
import 'package:flutter/material.dart';

import 'navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CariAkang',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // fontFamily:
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const NavigationPage(),
    );
  }
}
