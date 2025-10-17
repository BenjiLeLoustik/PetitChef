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
          children: recipes.map((recipe) {
            return RecipeCard(
              id: recipe['id']!,
              name: recipe['name']!,
              image: recipe['image'],
              level: recipe['level']!,
              category: recipe['category']!,
              time: recipe['time']!,
              date: recipe['date']!,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String id;
  final String name;
  final String? image;
  final String level;
  final String category;
  final String time;
  final String date;

  const RecipeCard({
    super.key,
    required this.id,
    required this.name,
    this.image,
    required this.level,
    required this.category,
    required this.time,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    Color levelColor;
    switch (level.toLowerCase()) {
      case 'facile':
        levelColor = Colors.lightGreen;
        break;
      case 'moyen':
        levelColor = Colors.orange;
        break;
      case 'difficile':
        levelColor = Colors.redAccent;
        break;
      default:
        levelColor = Colors.grey;
    }

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/recipe/$id'),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        margin: EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: image != null && image!.isNotEmpty
                    ? Image.asset(
                        image!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.no_food_outlined,
                          size: 40,
                          color: Colors.grey[400],
                        ),
                      ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: levelColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            level,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(category, style: TextStyle(color: Colors.grey[600])),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 16,
                              color: Colors.grey[600],
                            ), // Icon temps
                            SizedBox(width: 4),
                            Text(
                              time,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        Text(
                          "Ajouter le $date",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
