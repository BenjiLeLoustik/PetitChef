import 'package:flutter/material.dart';
import 'package:petit_chef/widgets/category_button.dart';
import 'package:petit_chef/widgets/favorite_recipe_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String activeCategory = 'Tout';
  String activeRecipe = '';

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

  final List<Map<String, String>> favoriteRecipes = [
    {'id': '1', 'image': '', 'name': 'Poulet rôti au miel'},
    {'id': '2', 'image': '', 'name': 'Salade de quinoa aux légumes'},
    {'id': '3', 'image': '', 'name': 'Smoothie tropical'},
    {'id': '4', 'image': '', 'name': 'Tarte aux pommes'}
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
        Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          width: double.infinity,
          child: Text('Recettes favorites',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Container(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: favoriteRecipes.map((recipe) {
                final id = recipe['id']!;
                final name = recipe['name']!;
                final image = recipe['image']!;
                final isActive = activeRecipe == name;
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: FavoriteRecipeButton(
                    id: id,
                    name: name,
                    image: image,
                    isActive: isActive,
                    onTap: () => setState(() => activeRecipe = name),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          width: double.infinity,
          child: Text('Recettes disponibles',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Column(
          children: [
          ],
        ),
      ],
    );
  }
}
