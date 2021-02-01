import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bibliotheque extends StatefulWidget {
  @override
  State<Bibliotheque> createState() => _BibliothequeState();
}

class _BibliothequeState extends State<Bibliotheque> {
  final _contenu = <String>["Un", "Livre", "Sympathique"];
  final _lus = <String>{};
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: _contenu.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Center(child: _buildRow(_contenu[index])),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  // #enddocregion _buildSuggestions

  // #docregion _buildRow
  Widget _buildRow(String pair) {
    final dejaLu = _lus.contains(pair);
    return ListTile(
      title: Text(
        pair,
        style: _biggerFont,
      ),
      trailing: Wrap(spacing: 12, children: <Widget>[
        Icon(dejaLu ? Icons.check_box_outlined: Icons.check_box_outline_blank,
            color: dejaLu ? Colors.blueGrey : null),
        TextButton.icon(
          onPressed: () {
            // Respond to button press
          },
          icon: Icon(Icons.arrow_forward, size: 18),
          label: Text("Résumé"),
        )
      ]),
      onTap: () {
        setState(() {
          if (dejaLu) {
            _lus.remove(pair);
          } else {
            _lus.add(pair);
          }
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
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  // #enddocregion RWS-build

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _lus.map(
                (String pair) {
              return ListTile(
                title: Text(
                  pair,
                  style: _biggerFont,
                ),
                trailing: TextButton.icon(
                  onPressed: () {
                    // Respond to button press
                  },
                  icon: Icon(Icons.arrow_forward, size: 18),
                  label: Text("Résumé"),
                ) ,
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
