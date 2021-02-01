import 'package:flutter/material.dart';
import 'package:tp1/information_widget.dart';
import 'package:tp1/bibliotheque_widget.dart';
import 'package:tp1/livreslus_widget.dart';
import 'package:tp1/main.dart';


class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [Bibliotheque(),
    LivresLus(),
    InformationWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ma Bibliothèque'),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
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
              icon: Icon(Icons.info_rounded),
              title: Text('Informations')
          )
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