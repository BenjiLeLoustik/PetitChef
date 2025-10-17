import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petit_chef/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  double progress = 0.0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 50), (Timer t) {
      setState(() {
        progress += 0.01;
        if (progress >= 1.0) {
          t.cancel();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => HomePage())
          );
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/petitchef_logo.png', width: 150 ),
            SizedBox(height: 20),
            Text('Bienvenue sur PetitChef !', style: TextStyle(
              fontSize: 20
            )),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(value: progress, color: Colors.orange, backgroundColor: Color(0xFFF1F1F1))
            )
          ],
        )
      )
    );
  }
}
