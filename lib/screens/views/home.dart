import 'package:flutter/material.dart';
import 'package:petit_chef/widgets/category_button.dart';

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

