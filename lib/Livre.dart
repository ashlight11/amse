import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'main.dart';

/* Classe qui permet d'avoir un type unfiforme de données à afficher
* Garantit une modularité plus grande car il suffit d'ajouter des nouveaux livres à la liste Bib_init
* pour agrandir sa bibliothèque.
* Le type Livre est géré sans modification par la suite.*/

class Livre {
  String title;
  String author;
  int year;
  Image cover;
  String pitch;
  bool read;

  Livre(String title, String author, int year, Image cover, String pitch) {
    this.title = title;
    this.year = year;
    this.cover = cover;
    this.pitch = pitch;
    this.author = author;
    this.read = false;
  }

  String getAuthor() {
    return this.author;
  }

  int getYear() {
    return this.year;
  }

  String getPitch() {
    return this.pitch;
  }

  void lire() {
    this.read = !this.read;
  }

  bool dejaLu() {
    return this.read;
  }
}
/* Retourne le livre désigné par le titre S */

Livre getLivre(String s) {
  Livre result;
  for (int i = 0; i < Bib_init.length; i++) {
    if (Bib_init[i].title == s) {
      result = Bib_init[i];
    }
  }
  return result;
}
/* Retourne un ensemble de livres déjà lus afin de les afficher dans l'onglet Déjà Lus
* Un set, à la différence du liste, empêche l'existence de deux éléments strictement identiques en son sein.*/
Set<String> getDejaLus() {
  var result = <String>{};
  for (int i = 0; i < Bib_init.length; i++) {
    if (Bib_init[i].read) {
      result.add(Bib_init[i].title);
    }
  }
  return result;
}

/* Retourne la liste des titres de la bibliothèque d'appel */
List<String> getTitres() {
  var result = <String>[];
  for (int i = 0; i < Bib_init.length; i++) {
    result.add(Bib_init[i].title);
  }
  return result;
}
