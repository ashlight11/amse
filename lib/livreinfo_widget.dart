import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Livre.dart';

class LivreInfo extends StatefulWidget {
  String titre;

  LivreInfo(String s) {
    this.titre = s;
  }

  @override
  State<LivreInfo> createState() => _LivreInfoState(titre);
}

class _LivreInfoState extends State<LivreInfo> {
  String titre;
  Livre selection;
  String auteur;
  int date;

  _LivreInfoState(String s) {
    this.titre = s;
    this.selection = getLivre(s);
    this.auteur = selection.getAuthor();
    this.date = selection.getYear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$titre"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 300,
              child: Center(child: selection.cover),
            ),
            Container(
              child: Center(
                  child: Text("\n Ecrit par $auteur en $date .\n",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, height: 3))),
            ),
            Container(
              child: Center(
                  child: Flexible(
                      child: Text(selection.getPitch(),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          style: TextStyle(height: 2)))),
            )
          ],
        ));
  }
}
