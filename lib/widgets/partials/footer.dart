import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home_rounded, color: Color(0xFFD8D8D8)),
                SizedBox(height: 5),
                Text(
                  'Home',
                  style: TextStyle(color: Color(0xFFD8D8D8), fontSize: 14),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search, color: Color(0xFFD8D8D8)),
                SizedBox(height: 5),
                Text(
                  'Recherche',
                  style: TextStyle(color: Color(0xFFD8D8D8), fontSize: 14),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart, color: Color(0xFFD8D8D8)),
                SizedBox(height: 5),
                Text(
                  'Liste',
                  style: TextStyle(color: Color(0xFFD8D8D8), fontSize: 14),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle, color: Color(0xFFD8D8D8)),
                SizedBox(height: 5),
                Text(
                  'Profil',
                  style: TextStyle(color: Color(0xFFD8D8D8), fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
