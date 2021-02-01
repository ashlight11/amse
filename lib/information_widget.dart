import 'package:flutter/material.dart';

class InformationWidget extends StatelessWidget {
  InformationWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Center(
            child: RichText(
          text: TextSpan(
            text: "Bienvenue sur la page d' ",
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: 'informations.\n \n \n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      "Cette application flutter a été développée par Marianne De Poorter en janvier 2021.\n \n \n",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15, color: Colors.black.withOpacity(0.6))),
              TextSpan(
                  text:
                  "Elle vous permet de gérer votre bibliothèque et de retrouver vos livres favoris.",
                  style: TextStyle(color: Colors.pinkAccent.withOpacity(0.9), fontSize: 17))
            ],
          ),
        )));
  }
}
