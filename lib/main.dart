import 'package:flutter/material.dart';
import 'package:petit_chef/screens/recipe_page.dart';
import 'package:petit_chef/screens/splash_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petit Chef',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name!);

        if (uri.path == '/') {
          return MaterialPageRoute(builder: (_) => const SplashScreen());
        }

        if (uri.path == '/recipe/add') {
          return MaterialPageRoute(builder: (_) => const Text('Ajout recette'));
        }

        if (uri.pathSegments.length == 3 &&
            uri.pathSegments[0] == 'recipe' &&
            uri.pathSegments[1] == 'remove') {
          final id = uri.pathSegments[2];
          return MaterialPageRoute(
            builder: (_) =>
                Text('Suppression recette ${id}'), //RemoveRecipeScreen(id: id),
          );
        }

        if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'recipe') {
          final id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (_) => RecipePage(id: id));
        }

        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Page Not Found ${settings.name}')),
          ),
        );
      },
    );
  }
}
