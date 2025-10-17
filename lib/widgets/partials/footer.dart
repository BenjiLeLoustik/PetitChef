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
          FooterButton(label: 'Home', icon: Icons.home_rounded),
          FooterButton(label: 'Recherche', icon: Icons.search),
          FooterButton(label: 'Liste', icon: Icons.shopping_cart),
          FooterButton(label: 'Profil', icon: Icons.account_circle),
        ],
      ),
    );
  }
}

class FooterButton extends StatefulWidget {
  final IconData icon;
  final String label;

  const FooterButton({
    super.key,
    required this.label,
    required this.icon
  });

  @override
  State<FooterButton> createState() => _FooterButtonState();
}

class _FooterButtonState extends State<FooterButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: (){},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: ColorTween(
                begin: Color(0xFFD8D8D8),
                end: isHovered ? Colors.orange : Color(0xFFD8D8D8),
              ),
              duration: duration,
              builder: (context, color, child) {
                return Icon(widget.icon, color: color);
              },
            ),
            SizedBox(height: 5),
            AnimatedDefaultTextStyle(
              duration: duration,
              style: TextStyle(
                  color: isHovered ? Color(0xFF2E2E2E) : Color(0xFFD8D8D8),
                  fontSize: 14
              ),
              child: Text(
                widget.label
              )
            ),
          ],
        )
      )
    );
  }
}
