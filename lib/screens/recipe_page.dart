import 'package:flutter/material.dart';
import 'package:petit_chef/models/recipe.dart';
import 'package:petit_chef/models/favorite_recipe.dart';
import 'package:petit_chef/screens/home_page.dart';
import 'package:petit_chef/widgets/partials/footer.dart';
import 'package:petit_chef/widgets/partials/header.dart';

class RecipePage extends StatefulWidget {
  final String id;

  const RecipePage({super.key, required this.id});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  String activePage = 'Recipe';

  void onFooterItemSelected(String label) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage(initialPage: label)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Recipe? recipe = Recipe.mockRecipes().firstWhere(
      (r) => r.id == widget.id,
    );

    Widget _buildPageContent() {
      if (recipe == null) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Aucune recette trouvée avec l\'ID ${widget.id}',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: recipe.image != null && recipe.image!.isNotEmpty
                    ? Image.asset(
                        recipe.image!,
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: double.infinity,
                        height: 220,
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.no_food_outlined,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                      ),
              ),
              Positioned(
                bottom: 10,
                left: 16,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    recipe.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: () => setState(() {
                    FavoriteRecipe.toggleFavorite(
                      id: recipe.id,
                      name: recipe.name,
                      image: recipe.image ?? '',
                    );
                  }),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      FavoriteRecipe.isFavorite(recipe.id)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.redAccent,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _infoChip(Icons.category, recipe.category),
              _infoChip(Icons.timer, recipe.time),
              _infoChip(
                Icons.star,
                recipe.level,
                color: _getLevelColor(recipe.level),
              ),
              _infoChip(Icons.date_range, "Ajoutée le ${recipe.date}"),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Instructions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(20),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              recipe.recipe ?? 'Aucune instruction disponible.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
          SizedBox(height: 20),
        ],
      );
    }

    return Material(
      color: Color(0xFFF9F9F9),
      child: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: _buildPageContent(),
              ),
            ),
            Footer(
              onItemSelected: onFooterItemSelected,
              activeLabel: activePage,
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoChip(IconData icon, String label, {Color? color}) {
    return Chip(
      avatar: Icon(icon, size: 18, color: color ?? Colors.grey[700]),
      label: Text(label, style: TextStyle(color: color ?? Colors.grey[800])),
      backgroundColor: Colors.grey[100],
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }

  Color _getLevelColor(String level) {
    switch (level.toLowerCase()) {
      case 'facile':
        return Colors.lightGreen;
      case 'moyen':
        return Colors.orange;
      case 'difficile':
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }
}
