import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            color: Colors.red,
            height: 60,
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [],
              )
            ),
          ),

          Container(
            color: Colors.green,
            height: 70,
          ),

        ],
      )
    );
  }
}
