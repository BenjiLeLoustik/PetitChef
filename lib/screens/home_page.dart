import 'package:flutter/material.dart';
import 'package:petit_chef/screens/views/home.dart';
import 'package:petit_chef/widgets/partials/footer.dart';
import 'package:petit_chef/widgets/partials/header.dart';

class HomePage extends StatefulWidget {
  final String initialPage;
  const HomePage({super.key, this.initialPage = 'Home'});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activePage = 'Home';

  @override
  void initState() {
    super.initState();
    activePage = widget.initialPage;
  }

  void onFooterItemSelected(String label) {
    setState(() {
      activePage = label;
    });
  }

  Widget _buildPageContent() {
    switch (activePage) {
      case 'Home':
        return Home();
      case 'Search':
        return const Text('Rechercher une recette');
      case 'List':
        return const Text('Votre liste');
      case 'Profile':
        return const Text('Votre profil');
      default:
        return const Text('Bienvenue sur la HomePage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF9F9F9),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: _buildPageContent(),
                ),
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
}
