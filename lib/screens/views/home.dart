import 'package:flutter/material.dart';
import 'package:petit_chef/widgets/category_button.dart';

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
          child: Text('Recettes favorites', style: TextStyle(fontWeight: FontWeight.bold)),
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
          child: Text('Recettes disponibles', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Column(
          children: [

          ],
        ),
      ],
    );
  }
}

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
        onTap: (){
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
                  child: Icon(Icons.no_food_outlined, size: 40, color: Colors.grey[400]),
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
