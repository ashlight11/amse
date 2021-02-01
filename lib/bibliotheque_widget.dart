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

  Widget _buildSuggestions() {
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

  Widget _buildRow(String pair) {
    final dejaLu = getLivre(pair).dejaLu();
    return ListTile(
      title: Text(
        pair,
        style: _biggerFont,
      ),
      leading: new CircleAvatar(
        child: getLivre(pair).cover,
      ),
      trailing: Wrap(spacing: 12, children: <Widget>[
        Icon(dejaLu ? Icons.check_box_outlined : Icons.check_box_outline_blank,
            color: dejaLu ? Colors.blueGrey : null),
        TextButton.icon(
          // Accéder aux informations sur le livre
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LivreInfo(pair)));
          },
          icon: Icon(Icons.arrow_forward, size: 18),
          label: Text("Résumé"),
        )
      ]),
      onTap: () {
        setState(() {
          getLivre(pair).lire();
        });
      },
    );
  }

  // #enddocregion _buildRow

  // #docregion RWS-build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livres à lire'),
      ),
      body: _buildSuggestions(),
    );
  }
}
