import 'package:flutter/material.dart';
import 'package:petit_chef/models/category.dart';
import 'package:petit_chef/models/favorite_recipe.dart';
import 'package:petit_chef/models/recipe.dart';
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

  late final List<Category> categories;
  late final List<FavoriteRecipe> favoriteRecipes;
  late final List<Recipe> recipes;

  @override
  void initState() {
    super.initState();
    categories = Category.mockCategories();
    favoriteRecipes = FavoriteRecipe.mockFavorites();
    recipes = Recipe.mockRecipes();
  }

  @override
  Widget build(BuildContext context) {
    final List<Recipe> filteredRecipes = activeCategory == 'Tout'
        ? recipes
        : recipes.where((recipe) => recipe.category == activeCategory).toList();

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
                    label: category.name,
                    isActive: activeCategory == category,
                    onTap: () => setState(() => activeCategory = category.name),
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
                final id = recipe.id;
                final name = recipe.name;
                final image = recipe.image;
                final isActive = activeRecipe == recipe.name;
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
                    id: recipe.id,
                    name: recipe.name,
                    image: recipe.image,
                    level: recipe.level,
                    category: recipe.category,
                    time: recipe.time,
                    date: recipe.date,
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
