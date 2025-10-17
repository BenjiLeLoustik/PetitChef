import 'package:flutter/material.dart';
import 'package:petit_chef/widgets/category_button.dart';
import 'package:petit_chef/widgets/favorite_recipe_button.dart';
import 'package:petit_chef/widgets/recipe_card.dart';

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
    {'id': '4', 'image': '', 'name': 'Tarte aux pommes'},
  ];

  final List<Map<String, String>> recipes = [
    {
      'id': '1',
      'image': '',
      'name': 'Spaghetti Bolognaise',
      'level': 'Difficile',
      'category': 'Pâtes',
      'time': '30min',
      'date': '12/10/2025',
    },
    {
      'id': '2',
      'image': '',
      'name': 'Salade César',
      'level': 'Moyen',
      'category': 'Salades',
      'time': '15min',
      'date': '12/10/2025',
    },
    {
      'id': '3',
      'image': '',
      'name': 'Soupe de légumes',
      'level': 'Facile',
      'category': 'Soupes',
      'time': '25min',
      'date': '12/10/2025',
    },
    {
      'id': '4',
      'image': '',
      'name': 'Poulet rôti au thym',
      'level': 'Facile',
      'category': 'Viandes',
      'time': '50min',
      'date': '11/10/2025',
    },
    {
      'id': '5',
      'image': '',
      'name': 'Saumon grillé au four',
      'level': 'Moyen',
      'category': 'Poissons',
      'time': '35min',
      'date': '10/10/2025',
    },
    {
      'id': '6',
      'image': '',
      'name': 'Tarte aux pommes',
      'level': 'Facile',
      'category': 'Desserts',
      'time': '45min',
      'date': '09/10/2025',
    },
    {
      'id': '7',
      'image': '',
      'name': 'Smoothie tropical',
      'level': 'Facile',
      'category': 'Smoothies',
      'time': '10min',
      'date': '08/10/2025',
    },
    {
      'id': '8',
      'image': '',
      'name': 'Gratin dauphinois',
      'level': 'Moyen',
      'category': 'Accompagnements',
      'time': '60min',
      'date': '07/10/2025',
    },
    {
      'id': '9',
      'image': '',
      'name': 'Omelette aux champignons',
      'level': 'Facile',
      'category': 'Œufs',
      'time': '15min',
      'date': '06/10/2025',
    },
    {
      'id': '10',
      'image': '',
      'name': 'Pancakes moelleux',
      'level': 'Facile',
      'category': 'Petit-déjeuner',
      'time': '20min',
      'date': '05/10/2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> filteredRecipes = activeCategory == 'Tout'
        ? recipes
        : recipes
              .where((recipe) => recipe['category'] == activeCategory)
              .toList();

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
          child: Text(
            'Recettes favorites',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
          child: Text(
            'Recettes disponibles',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: filteredRecipes.isNotEmpty
              ? filteredRecipes.map((recipe) {
                  return RecipeCard(
                    id: recipe['id']!,
                    name: recipe['name']!,
                    image: recipe['image'],
                    level: recipe['level']!,
                    category: recipe['category']!,
                    time: recipe['time']!,
                    date: recipe['date']!,
                  );
                }).toList()
              : [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Aucune recette trouvée pour cette catégorie.",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ),
                ],
        ),
      ],
    );
  }
}
