import 'package:flutter/material.dart';

import '../pages/home_page.dart';

import 'themes.dart' as themes;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themes.light,
      home: HomePage(),
    );
  }
}
