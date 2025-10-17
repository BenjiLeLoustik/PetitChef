import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 60,
            alignment: Alignment.center,
            child: Image.asset(
              'images/petitchef_logo.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 20),
          Expanded(child: Container(height: 50, width: 50, color: Colors.red)),
        ],
      ),
    );
  }
}
