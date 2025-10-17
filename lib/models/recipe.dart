class Recipe {
  String _id;
  String _name;
  String? _image;
  String _level;
  String _category;
  String _time;
  String _date;

  Recipe({
    required String id,
    required String name,
    String? image,
    required String level,
    required String category,
    required String time,
    required String date,
  }) : _id = id,
       _name = name,
       _image = image,
       _level = level,
       _category = category,
       _time = time,
       _date = date;

  String get id => _id;

  String get name => _name;

  String? get image => _image;

  String get level => _level;

  String get category => _category;

  String get time => _time;

  String get date => _date;

  set id(String value) => _id = value;

  set name(String value) => _name = value;

  set image(String? value) => _image = value;

  set level(String value) => _level = value;

  set category(String value) => _category = value;

  set time(String value) => _time = value;

  set date(String value) => _date = value;

  static List<Recipe> mockRecipes() {
    return [
      Recipe(
        id: '1',
        name: 'Spaghetti Bolognaise',
        level: 'Difficile',
        category: 'Pâtes',
        time: '30min',
        date: '12/10/2025',
      ),
      Recipe(
        id: '2',
        name: 'Salade César',
        level: 'Moyen',
        category: 'Salades',
        time: '15min',
        date: '12/10/2025',
      ),
      Recipe(
        id: '3',
        name: 'Soupe de légumes',
        level: 'Facile',
        category: 'Soupes',
        time: '25min',
        date: '12/10/2025',
      ),
      Recipe(
        id: '4',
        name: 'Poulet rôti au thym',
        level: 'Facile',
        category: 'Viandes',
        time: '50min',
        date: '11/10/2025',
      ),
      Recipe(
        id: '5',
        name: 'Saumon grillé au four',
        level: 'Moyen',
        category: 'Poissons',
        time: '35min',
        date: '10/10/2025',
      ),
      Recipe(
        id: '6',
        name: 'Tarte aux pommes',
        level: 'Facile',
        category: 'Desserts',
        time: '45min',
        date: '09/10/2025',
      ),
      Recipe(
        id: '7',
        name: 'Smoothie tropical',
        level: 'Facile',
        category: 'Smoothies',
        time: '10min',
        date: '08/10/2025',
      ),
      Recipe(
        id: '8',
        name: 'Gratin dauphinois',
        level: 'Moyen',
        category: 'Accompagnements',
        time: '60min',
        date: '07/10/2025',
      ),
      Recipe(
        id: '9',
        name: 'Omelette aux champignons',
        level: 'Facile',
        category: 'Œufs',
        time: '15min',
        date: '06/10/2025',
      ),
      Recipe(
        id: '10',
        name: 'Pancakes moelleux',
        level: 'Facile',
        category: 'Petit-déjeuner',
        time: '20min',
        date: '05/10/2025',
      ),
    ];
  }
}
