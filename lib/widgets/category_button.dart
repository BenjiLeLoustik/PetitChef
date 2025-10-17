import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color textColor = widget.isActive
        ? Colors.orange
        : isHovered
        ? Colors.grey[800]!
        : Colors.grey[600]!;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: textColor,
              fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}