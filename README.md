# 🍳 Petit Chef

Application mobile Flutter pour explorer et gérer vos recettes favorites.

## 📱 Fonctionnalités

- **Explorer les recettes** : Parcourez une collection de recettes avec images et informations clés
- **Détails des recettes** : Consultez les instructions complètes, le niveau de difficulté, le temps de préparation
- **Gestion des favoris** : Ajoutez et retirez facilement vos recettes préférées
- **Navigation intuitive** : Menu de navigation entre Home, Search, List et Profile

## 🏗️ Structure du projet

```
lib/
├── models/
│   ├── recipe.dart
│   ├── favorite_recipe.dart
│   └── category.dart
├── screens/
│   ├── home_page.dart
│   └── recipe_page.dart
└── widgets/
    └── partials/
        ├── header.dart
        ├── footer.dart
        └── ...
```

## 🔧 Modèles de données

### Recipe
Contient les informations complètes d'une recette :
- `id`, `name`, `image`, `recipe`, `level`, `category`, `time`, `date`

### FavoriteRecipe
Gère les recettes favorites avec :
- `id`, `name`, `image`
- Fonctions : `isFavorite()`, `toggleFavorite()`, `mockFavorites()`

## 🚀 Installation

```bash
# Cloner le projet
git clone https://github.com/BenjiLeLoustik/PetitChef

# Installer les dépendances
flutter pub get

# Lancer l'application
flutter run
```

## 📝 Utilisation

1. Ouvrez l'application sur la page d'accueil
2. Sélectionnez une recette pour voir ses détails
3. Utilisez le bouton favori pour sauvegarder vos recettes préférées
4. Naviguez entre les sections via le menu en bas d'écran

## 🎨 Captures d'écran

*À venir*

## 📦 Dépendances

- Flutter SDK
