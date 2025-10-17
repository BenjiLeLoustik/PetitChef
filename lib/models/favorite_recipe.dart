class FavoriteRecipe {
  String _id;
  String _name;
  String _image;

  FavoriteRecipe({
    required String id,
    required String name,
    required String image,
  }) : _id = id,
       _name = name,
       _image = image;

  String get id => _id;

  String get name => _name;

  String get image => _image;

  set id(String value) => _id = value;

  set name(String value) => _name = value;

  set image(String value) => _image = value;

  static List<FavoriteRecipe> mockFavorites() {
    return [
      FavoriteRecipe(id: '1', name: 'Poulet rôti au miel', image: ''),
      FavoriteRecipe(id: '2', name: 'Salade de quinoa aux légumes', image: ''),
      FavoriteRecipe(id: '3', name: 'Smoothie tropical', image: ''),
      FavoriteRecipe(id: '4', name: 'Tarte aux pommes', image: ''),
    ];
  }
}
