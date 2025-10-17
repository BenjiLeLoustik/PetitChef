import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  String activeLabel = 'Home';

  void setActive(String label) {
    setState((){
      activeLabel = label;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xFFFFFFFF),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FooterButton(
            label: 'Home',
            icon: Icons.home_rounded,
            isActive: activeLabel == 'Home',
            onTap: () => setActive('Home'),
          ),
          FooterButton(
            label: 'Recherche',
            icon: Icons.search,
            isActive: activeLabel == 'Search',
            onTap: () => setActive('Search'),
          ),
          FooterButton(
            label: 'Liste',
            icon: Icons.shopping_cart,
            isActive: activeLabel == 'List',
            onTap: () => setActive('List'),
          ),
          FooterButton(
            label: 'Profil',
            icon: Icons.account_circle,
            isActive: activeLabel == 'Profile',
            onTap: () => setActive('Profile'),
          ),
        ],
      ),
    );
  }
}

class FooterButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const FooterButton({
    super.key,
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<FooterButton> createState() => _FooterButtonState();
}

class _FooterButtonState extends State<FooterButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);

    final Color iconColor = widget.isActive
        ? Colors.orange
        : isHovered
        ? const Color(0xFF2E2E2E)
        : const Color(0xFFD8D8D8);

    final Color textColor = widget.isActive
        ? Colors.orange
        : isHovered
        ? Colors.orange
        : const Color(0xFFD8D8D8);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: ColorTween(
                begin: iconColor,
                end: iconColor,
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
                color: textColor,
                fontSize: 14,
              ),
              child: Text(widget.label),
            ),
          ],
        ),
      ),
    );
  }
}
