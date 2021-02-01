
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Livre.dart';

class LivreInfo extends StatefulWidget {
  String titre;

  LivreInfo(String s){
    this.titre = s;
  }
  @override
  State<LivreInfo> createState() => _LivreInfoState(titre);
}
class _LivreInfoState extends State<LivreInfo> {
  String titre;

  _LivreInfoState(String s){
    this.titre = s;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$titre"),
      ),
      body: Center( child :
          getLivre(titre).cover,
        ),
      );
  }
}