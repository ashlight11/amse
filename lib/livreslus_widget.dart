import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LivresLus extends StatefulWidget {
  @override
  State<LivresLus> createState() => _LivresLusState();
}

class _LivresLusState extends State<LivresLus> {
  final _suggestions = <String>["test", "je", "magic"];
  final _saved = <String>{};
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: _suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Center(child: _buildRow(_suggestions[index])),
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
      trailing: Wrap(spacing: 12, children: <Widget>[
        Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null),
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
