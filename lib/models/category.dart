class Category {
  String _name;

  Category({required String name}) : _name = name;

  String get name => _name;

  set name(String value) => _name = value;

  static List<Category> mockCategories() {
    return [
      Category(name: 'Tout'),
      Category(name: 'Viandes'),
      Category(name: 'Poissons'),
      Category(name: 'Légumes'),
      Category(name: 'Fruits'),
      Category(name: 'Desserts'),
      Category(name: 'Boissons'),
      Category(name: 'Végétarien'),
      Category(name: 'Vegan'),
      Category(name: 'Pâtes'),
      Category(name: 'Riz'),
      Category(name: 'Soupes'),
      Category(name: 'Salades'),
      Category(name: 'Pain'),
      Category(name: 'Fromages'),
      Category(name: 'Œufs'),
      Category(name: 'Petit-déjeuner'),
      Category(name: 'Collations'),
      Category(name: 'Cuisine du monde'),
      Category(name: 'Rapide'),
      Category(name: 'Épicé'),
      Category(name: 'Sans gluten'),
      Category(name: 'Sans lactose'),
      Category(name: 'Fritures'),
      Category(name: 'Grillades'),
      Category(name: 'Sauces'),
      Category(name: 'Smoothies'),
      Category(name: 'Cocktails'),
    ];
  }
}
