import 'package:flutter/material.dart';
import 'package:tp1/information_widget.dart';
import 'package:tp1/bibliotheque_widget.dart';
import 'package:tp1/livreslus_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

/* Création de la barre de navigation */
class _HomeState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Bibliotheque(),
    LivresLus(),
    InformationWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ma Bibliothèque'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Livres à lire'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Livres lus'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.info_rounded), title: Text('Informations'))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
