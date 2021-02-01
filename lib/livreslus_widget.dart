import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp1/livreinfo_widget.dart';
import 'package:tp1/Livre.dart';

import 'main.dart';

class LivresLus extends StatefulWidget {
  @override
  State<LivresLus> createState() => _LivresLusState();
}

class _LivresLusState extends State<LivresLus> {
  final _lus = getDejaLus().toList();
  final _saved = <String>{};
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
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

  // #enddocregion _buildSuggestions

  // #docregion _buildRow
  Widget _buildRow(String pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair,
        style: _biggerFont,
      ),
      leading: new CircleAvatar(
        child: getLivre(pair).cover,
      ),
      trailing: Wrap(spacing: 12, children: <Widget>[
        Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null),
        TextButton.icon(
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
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
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
        title: Text('Livres lus'),
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
          final tiles = _saved.map(
            (String pair) {
              return ListTile(
                title: Text(
                  pair,
                  style: _biggerFont,
                ),
                leading: new CircleAvatar(
                  child: getLivre(pair).cover,
                ),
                trailing: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LivreInfo(pair)));
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
