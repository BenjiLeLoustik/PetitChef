import 'package:flutter/material.dart';

class FavoriteRecipeButton extends StatefulWidget {
  final String id;
  final String name;
  final String? image;
  final bool isActive;
  final VoidCallback onTap;

  const FavoriteRecipeButton({
    super.key,
    required this.id,
    required this.name,
    this.image,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<FavoriteRecipeButton> createState() => _FavoriteRecipeButtonState();
}

class _FavoriteRecipeButtonState extends State<FavoriteRecipeButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color borderColor = widget.isActive
        ? Colors.orange
        : isHovered
        ? Colors.grey[800]!
        : Colors.grey[400]!;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          widget.onTap();
          Navigator.of(context).pushNamed('/recipe/${widget.id}');
        },
        child: Container(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: widget.image != null && widget.image!.isNotEmpty
                    ? Image.asset(
                        widget.image!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.no_food_outlined,
                          size: 40,
                          color: Colors.grey[400],
                        ),
                      ),
              ),
              SizedBox(height: 5),
              Text(
                widget.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: widget.isActive
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: borderColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
