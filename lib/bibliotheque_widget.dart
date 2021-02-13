import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp1/main.dart';

import 'Livre.dart';
import 'livreinfo_widget.dart';

class Bibliotheque extends StatefulWidget {
  @override
  State<Bibliotheque> createState() => _BibliothequeState();
}

class _BibliothequeState extends State<Bibliotheque> {
  final _contenu = Bib_titres;
  final _biggerFont = TextStyle(fontSize: 18.0);

  /* Constructeur de la liste des livres à afficher dans la bibliothèque */
  Widget _buildBibliotheque() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: Bib_init.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Center(child: _buildRow(_contenu[index])),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
/* Contenu des lignes et action possibles dessus */

  Widget _buildRow(String titre) {
    final dejaLu = getLivre(titre).dejaLu();
    return ListTile(
      title: Text(
        titre,
        style: _biggerFont,
      ),
      leading: new CircleAvatar( //-> CircleAvatar pour unifier l'affichage
        child: getLivre(titre).cover,
      ),
      trailing: Wrap(spacing: 12, children: <Widget>[
        // Permet d'ajouter un livre à sa liste des déjà lus
        Icon(dejaLu ? Icons.check_box_outlined : Icons.check_box_outline_blank,
            color: dejaLu ? Colors.blueGrey : null),
        TextButton.icon(
          // Accéder aux informations sur le livre
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LivreInfo(titre)));
          },
          icon: Icon(Icons.arrow_forward, size: 18),
          label: Text("Résumé"),
        )
      ]),
      onTap: () {
        setState(() {
          getLivre(titre).lire();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livres à lire'),
      ),
      body: _buildBibliotheque(),
    );
  }
}
