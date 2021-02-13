import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp1/livreinfo_widget.dart';
import 'package:tp1/Livre.dart';

/* Gère l'affichage des favoris */

class LivresLus extends StatefulWidget {
  @override
  State<LivresLus> createState() => _LivresLusState();
}

class _LivresLusState extends State<LivresLus> {
  final _lus = getDejaLus()
      .toList(); // -> ransforme un set en list afin d'itérer dans un ListView
  final _favoris = <String>{};
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildBibliotheque() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: _lus.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Center(child: _buildRow(_lus[index])),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  // #enddocregion _buildBibliotheque

  // #docregion _buildRow
  Widget _buildRow(String titre) {
    final alreadySaved = _favoris.contains(titre);
    return ListTile(
      title: Text(
        titre,
        style: _biggerFont,
      ),
      leading: new CircleAvatar(
        child: getLivre(titre).cover,
      ),
      trailing: Wrap(spacing: 12, children: <Widget>[
        // -> Permet d'ajouter ou d'enlever un livre de ses favoris
        Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null),
        TextButton.icon(
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
          // -> gère la liste dans les faits et rafraichit l'affichage
          if (alreadySaved) {
            _favoris.remove(titre);
          } else {
            _favoris.add(titre);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livres lus'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushFavoris),
        ],
      ),
      body: _buildBibliotheque(),
    );
  }

  /* Création des favoris au click sur l'icône de liste */
  void _pushFavoris() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _favoris.map(
            (String titre) {
              return ListTile(
                title: Text(
                  titre,
                  style: _biggerFont,
                ),
                leading: new CircleAvatar(
                  child: getLivre(titre).cover,
                ),
                trailing: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LivreInfo(titre)));
                  },
                  icon: Icon(Icons.arrow_forward, size: 18),
                  label: Text("Résumé"),
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Favoris'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
// #docregion RWS-var
}
// #enddocregion RWS-var
