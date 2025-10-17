import 'package:flutter/material.dart';
import 'package:petit_chef/widgets/partials/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Header(),

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
