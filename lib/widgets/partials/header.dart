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
          Expanded(
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  hintText: 'Rechercher...',
                  hintStyle: TextStyle(
                    color: Color(0xFF8E8E8E)
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  ),
                  hoverColor: Colors.white,
                  suffixIcon: Icon(Icons.search)
                ),
              )
            )
          ),
        ],
      ),
    );
  }
}
