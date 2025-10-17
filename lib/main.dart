import 'package:flutter/material.dart';
import 'package:petit_chef/screens/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petit Chef',
      home: Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        body: HomePage()
      ),
    );
  }
}
