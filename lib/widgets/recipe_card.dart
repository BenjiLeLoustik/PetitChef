import 'package:flutter/material.dart';

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