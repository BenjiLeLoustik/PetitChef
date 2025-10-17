import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String activeCategory = 'Tout';

  final List<String> categories = [
    'Tout',
    'Viandes',
    'Poissons',
    'Légumes',
    'Fruits',
    'Desserts',
    'Boissons',
    'Végétarien',
    'Vegan',
    'Pâtes',
    'Riz',
    'Soupes',
    'Salades',
    'Pain',
    'Fromages',
    'Œufs',
    'Petit-déjeuner',
    'Collations',
    'Cuisine du monde',
    'Rapide',
    'Épicé',
    'Sans gluten',
    'Sans lactose',
    'Fritures',
    'Grillades',
    'Sauces',
    'Smoothies',
    'Cocktails',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CategoryButton(
                    label: category,
                    isActive: activeCategory == category,
                    onTap: () => setState(() => activeCategory = category),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(height: 100, color: Colors.red),
        SizedBox(height: 10),
        Column(
          children: [
            Container(height: 120, color: Colors.grey),
            SizedBox(height: 10),
            Container(height: 120, color: Colors.grey),
            SizedBox(height: 10),
            Container(height: 120, color: Colors.grey),
            SizedBox(height: 10),
            Container(height: 120, color: Colors.grey),
            SizedBox(height: 10),
            Container(height: 120, color: Colors.grey),
            SizedBox(height: 10),
            Container(height: 120, color: Colors.grey),
            SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}

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
