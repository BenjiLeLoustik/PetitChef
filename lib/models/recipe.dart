class Recipe {
  String _id;
  String _name;
  String? _image;
  String? _recipe;
  String _level;
  String _category;
  String _time;
  String _date;

  Recipe({
    required String id,
    required String name,
    String? image,
    String? recipe,
    required String level,
    required String category,
    required String time,
    required String date,
  }) : _id = id,
       _name = name,
       _image = image,
       _recipe = recipe,
       _level = level,
       _category = category,
       _time = time,
       _date = date;

  String get id => _id;

  String get name => _name;

  String? get image => _image;

  String? get recipe => _recipe;

  String get level => _level;

  String get category => _category;

  String get time => _time;

  String get date => _date;

  set id(String value) => _id = value;

  set name(String value) => _name = value;

  set image(String? value) => _image = value;

  set recipe(String? value) => _recipe = value;

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
        recipe: '''Ingrédients:
- 200g de spaghetti
- 300g de viande hachée
- 1 oignon
- 400g de tomates concassées
- Sel, poivre, herbes de Provence

Étapes:
1. Faire cuire les spaghetti selon les instructions.
2. Faire revenir l'oignon et la viande hachée.
3. Ajouter les tomates, sel, poivre et herbes. Laisser mijoter 15 min.
4. Servir les spaghetti avec la sauce.''',
      ),
      Recipe(
        id: '2',
        name: 'Salade César',
        level: 'Moyen',
        category: 'Salades',
        time: '15min',
        date: '12/10/2025',
        recipe: '''Ingrédients:
- 1 laitue romaine
- 100g de poulet grillé
- Parmesan râpé
- Croûtons
- Sauce César

Étapes:
1. Laver et couper la laitue.
2. Ajouter le poulet, le parmesan et les croûtons.
3. Mélanger avec la sauce César et servir.''',
      ),
      Recipe(
        id: '3',
        name: 'Soupe de légumes',
        level: 'Facile',
        category: 'Soupes',
        time: '25min',
        date: '12/10/2025',
        recipe: '''Ingrédients:
- 2 carottes
- 2 pommes de terre
- 1 poireau
- Sel, poivre
- Eau

Étapes:
1. Éplucher et couper les légumes.
2. Faire bouillir de l'eau et ajouter les légumes.
3. Cuire 20 min et mixer la soupe.
4. Assaisonner et servir chaud.''',
      ),
      Recipe(
        id: '4',
        name: 'Poulet rôti au thym',
        level: 'Facile',
        category: 'Viandes',
        time: '50min',
        date: '11/10/2025',
        recipe: '''Ingrédients:
- 1 poulet entier
- 2 branches de thym
- 2 gousses d'ail
- Sel, poivre
- Huile d'olive

Étapes:
1. Préchauffer le four à 200°C.
2. Assaisonner le poulet avec sel, poivre, ail et thym.
3. Arroser d'huile et rôtir 45-50 min.
4. Servir chaud avec légumes.''',
      ),
      Recipe(
        id: '5',
        name: 'Saumon grillé au four',
        level: 'Moyen',
        category: 'Poissons',
        time: '35min',
        date: '10/10/2025',
        recipe: '''Ingrédients:
- 2 filets de saumon
- Jus de citron
- Sel, poivre
- Herbes de votre choix

Étapes:
1. Préchauffer le four à 180°C.
2. Assaisonner le saumon avec sel, poivre et herbes.
3. Arroser de jus de citron.
4. Cuire 20 min au four et servir.''',
      ),
      Recipe(
        id: '6',
        name: 'Tarte aux pommes',
        level: 'Facile',
        category: 'Desserts',
        time: '45min',
        date: '09/10/2025',
        recipe: '''Ingrédients:
- 1 pâte brisée
- 4 pommes
- 50g de sucre
- 20g de beurre

Étapes:
1. Préchauffer le four à 180°C.
2. Étaler la pâte dans un moule.
3. Couper les pommes en lamelles et disposer sur la pâte.
4. Saupoudrer de sucre et parsemer de beurre.
5. Cuire 35-40 min et servir tiède.''',
      ),
      Recipe(
        id: '7',
        name: 'Smoothie tropical',
        level: 'Facile',
        category: 'Smoothies',
        time: '10min',
        date: '08/10/2025',
        recipe: '''Ingrédients:
- 1 banane
- 1 mangue
- 200ml de jus d'orange
- Glaçons

Étapes:
1. Éplucher les fruits et les couper.
2. Mixer les fruits avec le jus d'orange et les glaçons.
3. Servir frais.''',
      ),
      Recipe(
        id: '8',
        name: 'Gratin dauphinois',
        level: 'Moyen',
        category: 'Accompagnements',
        time: '60min',
        date: '07/10/2025',
        recipe: '''Ingrédients:
- 1kg de pommes de terre
- 50cl de crème
- 2 gousses d'ail
- Sel, poivre, muscade

Étapes:
1. Préchauffer le four à 180°C.
2. Éplucher et couper les pommes de terre en fines rondelles.
3. Frotter un plat à gratin avec l'ail et disposer les pommes de terre.
4. Ajouter crème, sel, poivre et muscade.
5. Cuire 50-60 min au four et servir chaud.''',
      ),
      Recipe(
        id: '9',
        name: 'Omelette aux champignons',
        level: 'Facile',
        category: 'Œufs',
        time: '15min',
        date: '06/10/2025',
        recipe: '''Ingrédients:
- 3 œufs
- 100g de champignons
- Sel, poivre
- Beurre

Étapes:
1. Battre les œufs avec sel et poivre.
2. Faire revenir les champignons dans du beurre.
3. Verser les œufs et cuire l'omelette.
4. Servir chaud.''',
      ),
      Recipe(
        id: '10',
        name: 'Pancakes moelleux',
        level: 'Facile',
        category: 'Petit-déjeuner',
        time: '20min',
        date: '05/10/2025',
        recipe: '''Ingrédients:
- 150g de farine
- 2 œufs
- 200ml de lait
- 30g de sucre
- 1 sachet de levure chimique
- Beurre

Étapes:
1. Mélanger farine, sucre et levure.
2. Ajouter œufs et lait, bien mélanger.
3. Faire cuire des petites crêpes dans une poêle beurrée.
4. Servir avec sirop d'érable ou fruits.''',
      ),
    ];
  }

}
